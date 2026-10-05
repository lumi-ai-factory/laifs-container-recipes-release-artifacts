ARG BASE_IMAGE=ubuntu
ARG BASE_IMAGE_TAG=noble-20260911
ARG AMDGPU_REPO=https://repo.radeon.com/amdgpu
ARG AMDGPU_VERSION=6.4.4
ARG ROCM_REPO=https://repo.radeon.com/rocm
ARG ROCM_VERSION=7.2.4
ARG EXTRA_LOCALES="cs_CZ.UTF-8 da_DK.UTF-8 en_DK.UTF-8 en_US.UTF-8 et_EE.UTF-8 fi_FI.UTF-8 nb_NO.UTF-8 nn_NO.UTF-8 pl_PL.UTF-8"
ARG EXTRA_PACKAGES="file git jq less libdw1t64 lsof nano neovim python3-dev python3-packaging python3-pip python3-venv screen tmux unzip wget"

FROM $BASE_IMAGE:$BASE_IMAGE_TAG

ARG BASE_IMAGE \
    BASE_IMAGE_TAG

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1

ENV GIT_TERMINAL_PROMPT=0

ARG EXTRA_LOCALES \
    EXTRA_PACKAGES

RUN set -e;\
  #
  # Enable man pages with unminimize and install additional locales
  #
  printf '%s\n' 'Dpkg::Use-Pty "0";' > /etc/apt/apt.conf.d/99no-progress; \
  apt-get update && \
  yes | unminimize && \
  apt-get -y --no-install-recommends install man locales && \
  locale-gen ${EXTRA_LOCALES}; \
  #
  # Install extra packages
  #
  apt-get install -y --no-install-recommends ca-certificates curl gnupg \
    build-essential cmake kmod libelf1 libnuma-dev \
    pkgconf zstd ${EXTRA_PACKAGES}

RUN git config --global advice.detachedHead false

ARG AMDGPU_REPO \
    AMDGPU_VERSION

ARG ROCM_REPO \
    ROCM_VERSION

RUN set -ue;\
  #
  # Add ROCm repository
  #
  printf "Package: *\nPin: release o=repo.radeon.com\nPin-Priority: 800\n" > /etc/apt/preferences.d/rocm-pin-prio-800 && \
  #
  mkdir -p --mode=0755 /etc/apt/keyrings && \
  curl -sL ${ROCM_REPO}/rocm.gpg.key | gpg --dearmor | tee /etc/apt/keyrings/rocm.gpg > /dev/null && \
  #
  printf "deb [arch=amd64 signed-by=/etc/apt/keyrings/rocm.gpg] ${ROCM_REPO}/apt/${ROCM_VERSION}/ noble main\n" | tee /etc/apt/sources.list.d/rocm.list && \
  printf "deb [arch=amd64 signed-by=/etc/apt/keyrings/rocm.gpg] ${AMDGPU_REPO}/${AMDGPU_VERSION}/ubuntu noble main\n" | tee /etc/apt/sources.list.d/amdgpu.list && \
  #
  # Install ROCm packages
  #
  apt-get update && \
  apt-get install -y --no-install-recommends libdrm-amdgpu-dev rocm-dev rocm-libs && \
  #
  echo /opt/rocm/lib > /etc/ld.so.conf.d/rocm-30.conf && \
  ldconfig

RUN set -e;\
  #
  # Add SBOM
  #
  apt_json="$(dpkg-query -W -f='${Package}\t${Version}\n' | jq -R -s 'split("\n")[:-1] | map(split("\t") | {name: .[0], version: .[1]})')"; \
  jq -n --argjson apt "$apt_json"  '{apt: $apt}' > /.sbom.json;

ENV ROCM_PATH=/opt/rocm
