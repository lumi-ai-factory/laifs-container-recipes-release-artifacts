# Start of dynamically injected content
ARG BASE_IMAGE_TAG=20260415_130625
# End of dynamically injected content
ARG BASE_IMAGE=lumi-multitorch-mpich-u24r70f21m50t210
ARG TORCH_REPO=https://github.com/pytorch/pytorch
ARG TORCH_VERSION=2.10.0
ARG TORCH_ROCM_VERSION=rocm7.0
ARG TORCH_GPU_ARCH=gfx90a
ARG TORCH_PATCHES="https://github.com/viahlgre/pytorch/commit/f0374f296279f6fbdb3437a144b226521d00b788.patch"
ARG TORCH_PIP_DEPENDENCIES="mkl-include mkl-static ninja numpy packaging pyyaml requests setuptools six typing_extensions"
ARG TORCH_APT_DEPENDENCIES="ccache cmake libjpeg-dev libopenblas-dev libpng-dev numactl"
ARG PYTORCH_TRITON_URL=https://download.pytorch.org/whl/triton_rocm-3.6.0-cp312-cp312-linux_x86_64.whl
ARG TORCHAUDIO_URL=https://download-r2.pytorch.org/whl/rocm7.0/torchaudio-2.10.0%2Brocm7.0-cp312-cp312-manylinux_2_28_x86_64.whl
ARG TORCHVISION_URL=https://download-r2.pytorch.org/whl/rocm7.0/torchvision-0.25.0%2Brocm7.0-cp312-cp312-manylinux_2_28_x86_64.whl
ARG FAKE_TRITON_URL=git+https://github.com/viahlgre/fake-triton.git@d35f4ca
ARG WRETAG_URL=git+https://github.com/viahlgre/wretag.git@0da1af0

FROM $BASE_IMAGE:$BASE_IMAGE_TAG

ARG BASE_IMAGE
ARG BASE_IMAGE_TAG

ARG TORCH_REPO
ARG TORCH_VERSION
ARG TORCH_ROCM_VERSION
ARG TORCH_GPU_ARCH
ARG TORCH_PATCHES

ARG TORCH_PIP_DEPENDENCIES
ARG TORCH_APT_DEPENDENCIES

ARG PYTORCH_TRITON_URL
ARG FAKE_TRITON_URL
ARG TORCHAUDIO_URL
ARG TORCHVISION_URL

ARG WRETAG_URL

RUN set -ue; \
  #
  mkdir /opt/src; \
  mkdir /opt/wheels; \
  #
  test -f /opt/rocm/lib/llvm/bin/amdgpu-arch.really && { echo "error: amdgpu-arch.really already exists"; false; } || true; \
  mv /opt/rocm/lib/llvm/bin/amdgpu-arch /opt/rocm/lib/llvm/bin/amdgpu-arch.really; \
  printf "#!/bin/bash\necho ${TORCH_GPU_ARCH}\n" > /opt/rocm/lib/llvm/bin/amdgpu-arch; \
  chmod a+rx /opt/rocm/lib/llvm/bin/amdgpu-arch; \
  #
  apt-get update; \
  apt-get -y install ${TORCH_APT_DEPENDENCIES}; \
  apt clean ;\
  #
  python3.12 -m venv /opt/venv; \
  . /opt/venv/bin/activate; \
  #
  pip install --no-cache-dir "${WRETAG_URL}"; \
  pip install --no-cache-dir ${TORCH_PIP_DEPENDENCIES}; \
  pip install --no-cache-dir ${PYTORCH_TRITON_URL}; \
  #
  git clone --branch "v${TORCH_VERSION}" --recursive ${TORCH_REPO}; \
  #
  cd pytorch/; \
  #
  for PATCH_URL in ${TORCH_PATCHES}; do curl -s $PATCH_URL | git apply; done; \
  #
  git status; \
  #
  export GPU_ARCH_TYPE=rocm; \
  export ROCM_HOME=/opt/rocm; \
  export PYTORCH_ROCM_ARCH=${TORCH_GPU_ARCH}; \
  export DESIRED_CUDA=${TORCH_ROCM_VERSION}; \
  #
  export CC=gcc; \
  export CXX=g++; \
  #
  export USE_CUDA=0; \
  export USE_ROCM=1; \
  #
  export USE_MPI=1; \
  export USE_C10D_MPI=1; \
  export USE_SYSTEM_NCCL=1; \
  export USE_STATIC_NCCL=0; \
  #
  export BUILD_TEST=0; \
  export INSTALL_TEST=0; \
  export MAX_JOBS="$(nproc)"; \
  #
  export PYTORCH_BUILD_VERSION="${TORCH_VERSION}+${TORCH_ROCM_VERSION}"; \
  export PYTORCH_BUILD_NUMBER=1; \
  #
  python3.12 tools/amd_build/build_amd.py; \
  python -m pip wheel --no-build-isolation --no-deps -v -w /opt/wheels .; \
  #
  wheel_path="$(find /opt/wheels  -mindepth 1 -maxdepth 1 -type f -name '*.whl')"; \
  test $(echo $wheel_path | wc -w) = 1; \
  new_wheel="$(wretag -d -q ${TORCH_ROCM_VERSION}_lumi_aif_$(date -u +'%Y%m%d%H%M%S') $wheel_path)"; \
  pip install $new_wheel; \
  #
  rm -f /opt/wheels/torch-*.whl; \
  #
  pip install $TORCHAUDIO_URL $TORCHVISION_URL $FAKE_TRITON_URL; \
  #
  pip cache purge; \
  #
  rm -rf /opt/src/pytorch; \
  #
  rmdir /opt/src; \
  rmdir /opt/wheels; \
  #
  test -f /opt/rocm/lib/llvm/bin/amdgpu-arch.really || { echo "error: amdgpu-arch.really is missing"; false; }; \
  rm /opt/rocm/lib/llvm/bin/amdgpu-arch; \
  mv /opt/rocm/lib/llvm/bin/amdgpu-arch.really /opt/rocm/lib/llvm/bin/amdgpu-arch; \
  #
  # Add SBOM
  #
  apt_json="$(dpkg-query -W -f='${Package}\t${Version}\n' | jq -R -s 'split("\n")[:-1] | map(split("\t") | {name: .[0], version: .[1]})')"; \
  pip_json="$(pip list --format=json)"; \
  jq -n --argjson apt "$apt_json"  --argjson pip "$pip_json" '{apt: $apt, pip: $pip}' > /.sbom.json;

ENV PATH="/opt/venv/bin:$PATH"
ENV PYTHONPATH="/opt/venv/lib/python3.12/site-packages:$PYTHONPATH"

CMD ["/bin/bash"]
