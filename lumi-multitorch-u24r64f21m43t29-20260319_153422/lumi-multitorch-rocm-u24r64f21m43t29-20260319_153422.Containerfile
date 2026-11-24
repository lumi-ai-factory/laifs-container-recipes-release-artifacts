ARG BASE_IMAGE=ubuntu
ARG BASE_IMAGE_TAG=noble-20260217
ARG AMDGPU_REPO=https://repo.radeon.com/amdgpu
ARG AMDGPU_VERSION=6.4.4
ARG ROCM_REPO=https://repo.radeon.com/rocm
ARG ROCM_VERSION=6.4.4
ARG EXTRA_LOCALES="cs_CZ.UTF-8 da_DK.UTF-8 en_US.UTF-8 et_EE.UTF-8 fi_FI.UTF-8 nb_NO.UTF-8 nn_NO.UTF-8 pl_PL.UTF-8"
ARG EXTRA_PACKAGES="file git jq less lsof nano neovim python3-dev python3-packaging python3-pip python3-venv screen tmux unzip wget"

FROM $BASE_IMAGE:$BASE_IMAGE_TAG

ARG BASE_IMAGE
ARG BASE_IMAGE_TAG

ARG AMDGPU_REPO
ARG AMDGPU_VERSION

ARG ROCM_REPO
ARG ROCM_VERSION

ARG EXTRA_LOCALES
ARG EXTRA_PACKAGES

RUN set -ue; \
  #
  # Enable man pages with unminimize and install additional locales
  #
  export DEBIAN_FRONTEND=noninteractive; \
  apt-get update; \
  yes | unminimize; \
  apt-get -y --no-install-recommends install man locales; \
  locale-gen ${EXTRA_LOCALES}; \
  #
  # Add ROCm repository
  #
  apt-get install -y --no-install-recommends ca-certificates curl gnupg; \
  #
  printf "Package: *\nPin: release o=repo.radeon.com\nPin-Priority: 800\n" > /etc/apt/preferences.d/rocm-pin-prio-800; \
  #
  curl -sL ${ROCM_REPO}/rocm.gpg.key | apt-key add -; \
  #
  printf "deb [arch=amd64] ${ROCM_REPO}/apt/${ROCM_VERSION}/ noble main\n" | tee --append /etc/apt/sources.list.d/rocm.list; \
  printf "deb [arch=amd64] ${AMDGPU_REPO}/${AMDGPU_VERSION}/ubuntu noble main\n" | tee /etc/apt/sources.list.d/amdgpu.list; \
  #
  # Install ROCm packages
  #
  apt-get update; \
  apt-get install -y --no-install-recommends build-essential kmod libelf1 libnuma-dev zstd; \
  apt-get install -y --no-install-recommends amdgpu-dkms rocm-dev$ROCM_VERSION rocm-libs$ROCM_VERSION; \
  #
  echo /opt/rocm/lib > /etc/ld.so.conf.d/rocm-30.conf; \
  ldconfig; \
  #
  # Install extra packages
  #
  apt-get -y --no-install-recommends install ${EXTRA_PACKAGES}; \
  apt clean ;\
  rm -rf /var/lib/apt/lists/*; \
  #
  # Add SBOM
  #
  apt_json="$(dpkg-query -W -f='${Package}\t${Version}\n' | jq -R -s 'split("\n")[:-1] | map(split("\t") | {name: .[0], version: .[1]})')"; \
  jq -n --argjson apt "$apt_json"  '{apt: $apt}' > /.sbom.json;
