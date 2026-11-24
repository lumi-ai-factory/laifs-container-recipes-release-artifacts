# Start of dynamically injected content
ARG BASE_IMAGE_TAG=20260319_153422
# End of dynamically injected content
ARG BASE_IMAGE=lumi-multitorch-mpich-u24r64f21m43t29
ARG TORCH_VERSION=2.9.1
ARG PYTORCH_TRITON_URL=https://download.pytorch.org/whl/pytorch_triton_rocm-3.5.1-cp312-cp312-linux_x86_64.whl
ARG FAKE_TRITON_URL=git+https://github.com/viahlgre/fake-triton.git@a8412a9
ARG TORCHAUDIO_URL=https://download.pytorch.org/whl/rocm6.4/torchaudio-2.9.1%2Brocm6.4-cp312-cp312-manylinux_2_28_x86_64.whl
ARG TORCHVISION_URL=https://download.pytorch.org/whl/rocm6.4/torchvision-0.24.1%2Brocm6.4-cp312-cp312-manylinux_2_28_x86_64.whl
ARG TORCH_URL=https://download.pytorch.org/whl/rocm6.4/torch-2.9.1%2Brocm6.4-cp312-cp312-manylinux_2_28_x86_64.whl

FROM $BASE_IMAGE:$BASE_IMAGE_TAG

ARG BASE_IMAGE
ARG BASE_IMAGE_TAG
ARG PYTORCH_TRITON_URL
ARG FAKE_TRITON_URL
ARG TORCHAUDIO_URL
ARG TORCHVISION_URL
ARG TORCH_URL

RUN set -ue; \
  #
  # Create new venv and install Pytorch
  #
  python3.12 -m venv /opt/venv; \
  . /opt/venv/bin/activate; \
  pip install $PYTORCH_TRITON_URL $TORCHAUDIO_URL $TORCHVISION_URL $TORCH_URL $FAKE_TRITON_URL patchelf; \
  pip cache purge; \
  # Patch torch to prefer system rocm
  patchelf --set-rpath '/opt/rocm/lib:/usr/lib:$ORIGIN' /opt/venv/lib/python3.12/site-packages/torch/lib/libtorch_hip.so; \
  #
  # Add SBOM
  #
  apt_json="$(dpkg-query -W -f='${Package}\t${Version}\n' | jq -R -s 'split("\n")[:-1] | map(split("\t") | {name: .[0], version: .[1]})')"; \
  pip_json="$(pip list --format=json)"; \
  jq -n --argjson apt "$apt_json"  --argjson pip "$pip_json" '{apt: $apt, pip: $pip}' > /.sbom.json;

ENV PATH="/opt/venv/bin:$PATH"
ENV PYTHONPATH="/opt/venv/lib/python3.12/site-packages:$PYTHONPATH"

CMD ["/bin/bash"]
