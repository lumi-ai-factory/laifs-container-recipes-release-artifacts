# Release notes for lumi-multitorch-u24r70f21m50t210-20260513_121430

**Release Links:**
- [Release README](https://github.com/lumi-ai-factory/laifs-container-recipes-release-artifacts/blob/main/lumi-multitorch-u24r70f21m50t210-20260513_121430/lumi-multitorch-u24r70f21m50t210-20260513_121430.md)
- [GitHub Release](https://github.com/lumi-ai-factory/laifs-container-recipes/releases/tag/lumi-multitorch-u24r70f21m50t210-20260513_121430)
- [Recipe Changes](https://github.com/lumi-ai-factory/laifs-container-recipes/compare/lumi-multitorch-u24r70f21m50t210-20260415_130625...lumi-multitorch-u24r70f21m50t210-20260513_121430)
- [Known Issues](https://github.com/lumi-ai-factory/laifs-container-recipes/issues?q=label%3Alumi-multitorch-u24r70f21m50t210-20260513_121430)

This release introduces some changes to the build process of the LUMI AI Factory
`lumi-multitorch` container collection. It also includes a few minor version updates.

## Major Updates

### Replace SIF runscript with OCI entrypoint
- Certain runtime variables like `FI_HMEM_DISABLE_P2P` were previously set using
  a runscript that was included in the container's SIF definition file. This is
  now done using an entrypoint script included in the OCI image. Consequently,
  SIF definition files are no longer used in the build or included in the release
  artifacts.
- In practice, this change means that the SIF images' runtime behavior is now
  shared by the `lumi-multitorch` OCI images on Docker Hub, and inherited by any
  custom containers that use them as their base image.

## Other changes

- Change from SingularityCE to Apptainer for building containers
  - Containers are now built using Apptainer, which is a continuation of the
    original Singularity project, rather than the previously used SingularityCE,
    which is Sylabs' fork of the same. This does not effect any practical change
    in the containers' functionality.
- Minor version updates to locally built (APT) and PyPI packages, including
  AWS OFI NCCL, MPICH and vLLM. See the complete list of updates below.
- The `amd_smi` Python package is installed earlier in the build pipeline.
  Previously this was installed as a dependency of vLLM in the `lumi-multitorch-full`
  build stage, but now it is explicitly installed in the `lumi-multitorch-torch` stage,
  meaning Python bindings for the AMD SMI library are already usable in the latter
  container.

## Package changes

Comprehensive list of package changes comparing the following releases:

- `lumi-multitorch-full-u24r70f21m50t210-20260415_130625`
- `lumi-multitorch-full-u24r70f21m50t210-20260513_121430`

### APT Package Changes

**Changed:**

- `aws-ofi-nccl` 1.18.0-git-c1b89cc -> 1.19.1-git-206c02c
- `curl` 8.5.0-2ubuntu10.8 -> 8.5.0-2ubuntu10.9
- `dpkg` 1.22.6ubuntu6.5 -> 1.22.6ubuntu6.6
- `dpkg-dev` 1.22.6ubuntu6.5 -> 1.22.6ubuntu6.6
- `jq` 1.7.1-3ubuntu0.24.04.1 -> 1.7.1-3ubuntu0.24.04.2
- `kmod` 31+20240202-2ubuntu7.1 -> 31+20240202-2ubuntu7.2
- `libcap2` 1:2.66-5ubuntu2.2 -> 1:2.66-5ubuntu2.4
- `libcurl3t64-gnutls` 8.5.0-2ubuntu10.8 -> 8.5.0-2ubuntu10.9
- `libcurl4-openssl-dev` 8.5.0-2ubuntu10.8 -> 8.5.0-2ubuntu10.9
- `libcurl4t64` 8.5.0-2ubuntu10.8 -> 8.5.0-2ubuntu10.9
- `libdpkg-perl` 1.22.6ubuntu6.5 -> 1.22.6ubuntu6.6
- `libjq1` 1.7.1-3ubuntu0.24.04.1 -> 1.7.1-3ubuntu0.24.04.2
- `libkmod2` 31+20240202-2ubuntu7.1 -> 31+20240202-2ubuntu7.2
- `liblcms2-2` 2.14-2build1 -> 2.14-2ubuntu0.1
- `libnghttp2-14` 1.59.0-1ubuntu0.2 -> 1.59.0-1ubuntu0.3
- `libopenjp2-7` 2.5.0-2ubuntu0.4 -> 2.5.0-2ubuntu0.5
- `libpng-dev` 1.6.43-5ubuntu0.5 -> 1.6.43-5ubuntu0.6
- `libpng-tools` 1.6.43-5ubuntu0.5 -> 1.6.43-5ubuntu0.6
- `libpng16-16t64` 1.6.43-5ubuntu0.5 -> 1.6.43-5ubuntu0.6
- `libpython3.12-dev` 3.12.3-1ubuntu0.12 -> 3.12.3-1ubuntu0.13
- `libpython3.12-minimal` 3.12.3-1ubuntu0.12 -> 3.12.3-1ubuntu0.13
- `libpython3.12-stdlib` 3.12.3-1ubuntu0.12 -> 3.12.3-1ubuntu0.13
- `libpython3.12t64` 3.12.3-1ubuntu0.12 -> 3.12.3-1ubuntu0.13
- `linux-libc-dev` 6.8.0-110.110 -> 6.8.0-111.111
- `mpich` 5.0.0 -> 5.0.1
- `python3.12` 3.12.3-1ubuntu0.12 -> 3.12.3-1ubuntu0.13
- `python3.12-dev` 3.12.3-1ubuntu0.12 -> 3.12.3-1ubuntu0.13
- `python3.12-minimal` 3.12.3-1ubuntu0.12 -> 3.12.3-1ubuntu0.13
- `python3.12-venv` 3.12.3-1ubuntu0.12 -> 3.12.3-1ubuntu0.13
- `sed` 4.9-2build1 -> 4.9-2ubuntu0.24.04.1

### PyPI Package Changes

**Changed:**

- `GitPython` 3.1.46 -> 3.1.50
- `Mako` 1.3.11 -> 1.3.12
- `amd-quark` 0.11.1 -> 0.11.2
- `anthropic` 0.95.0 -> 0.102.0
- `auto-round` 0.12.2 -> 0.12.3
- `azure-core` 1.39.0 -> 1.41.0
- `boto3` 1.42.89 -> 1.43.7
- `botocore` 1.42.89 -> 1.43.7
- `build` 1.4.3 -> 1.5.0
- `cachetools` 7.0.5 -> 7.1.1
- `cbor2` 5.9.0 -> 6.1.0
- `certifi` 2026.2.25 -> 2026.4.22
- `click` 8.3.2 -> 8.3.3
- `compressed-tensors` 0.15.1a20260414 -> 0.15.0.1
- `databricks-sdk` 0.102.0 -> 0.108.0
- `datasets` 4.8.4 -> 4.8.5
- `deepspeed` 0.18.8+lumi.aif.dsops -> 0.18.9+lumi.aif.dsops
- `fastapi` 0.135.3 -> 0.136.1
- `fastapi-cloud-cli` 0.17.0 -> 0.17.1
- `filelock` 3.28.0 -> 3.29.0
- `gguf` 0.18.0 -> 0.19.0
- `google-auth` 2.49.2 -> 2.52.0
- `google-cloud-core` 2.5.1 -> 2.6.0
- `google-resumable-media` 2.8.2 -> 2.9.0
- `googleapis-common-protos` 1.74.0 -> 1.75.0
- `greenlet` 3.4.0 -> 3.5.0
- `hf-xet` 1.4.3 -> 1.5.0
- `idna` 3.11 -> 3.15
- `impi-devel` 2021.17.2 -> 2021.18.0
- `impi-rt` 2021.17.2 -> 2021.18.0
- `intel-cmplr-lib-rt` 2025.3.3 -> 2026.0.0
- `intel-cmplr-lib-ur` 2025.3.3 -> 2026.0.0
- `intel-cmplr-lic-rt` 2025.3.3 -> 2026.0.0
- `intel-openmp` 2025.3.3 -> 2026.0.0
- `intel-sycl-rt` 2025.3.3 -> 2026.0.0
- `ipython` 9.12.0 -> 9.13.0
- `jedi` 0.19.2 -> 0.20.0
- `jupyter-events` 0.12.0 -> 0.12.1
- `jupyter_server` 2.17.0 -> 2.18.2
- `jupyterlab` 4.5.6 -> 4.5.7
- `llmcompressor` 0.10.0.2.dev0+lumi.aif.6a6cfec -> 0.10.0.3.dev0+lumi.aif.5a1552e
- `llvmlite` 0.44.0 -> 0.47.0
- `markdown-it-py` 4.0.0 -> 4.2.0
- `matplotlib` 3.10.8 -> 3.10.9
- `matplotlib-inline` 0.2.1 -> 0.2.2
- `mcp` 1.27.0 -> 1.27.1
- `mistral_common` 1.11.0 -> 1.11.2
- `mistune` 3.2.0 -> 3.2.1
- `mkl-include` 2025.3.1 -> 2026.0.0
- `mkl-static` 2025.3.1 -> 2026.0.0
- `mlflow` 3.11.1 -> 3.12.0
- `mlflow-skinny` 3.11.1 -> 3.12.0
- `mlflow-tracing` 3.11.1 -> 3.12.0
- `model-hosting-container-standards` 0.1.14 -> 0.1.15
- `narwhals` 2.19.0 -> 2.21.0
- `notebook` 7.5.5 -> 7.5.6
- `numba` 0.61.2 -> 0.65.0
- `oneccl` 2021.17.2 -> 2022.0.0
- `oneccl-devel` 2021.17.2 -> 2022.0.0
- `onemkl-license` 2025.3.1 -> 2026.0.0
- `onnx-ir` 0.2.0 -> 0.2.1
- `onnxscript` 0.6.2 -> 0.7.0
- `onnxslim` 0.1.91 -> 0.1.93
- `openai` 2.32.0 -> 2.36.0
- `opentelemetry-api` 1.41.0 -> 1.41.1
- `opentelemetry-exporter-otlp` 1.41.0 -> 1.41.1
- `opentelemetry-exporter-otlp-proto-common` 1.41.0 -> 1.41.1
- `opentelemetry-exporter-otlp-proto-grpc` 1.41.0 -> 1.41.1
- `opentelemetry-exporter-otlp-proto-http` 1.41.0 -> 1.41.1
- `opentelemetry-proto` 1.41.0 -> 1.41.1
- `opentelemetry-sdk` 1.41.0 -> 1.41.1
- `opentelemetry-semantic-conventions` 0.62b0 -> 0.62b1
- `outlines_core` 0.2.11 -> 0.2.14
- `packaging` 26.1 -> 26.2
- `parso` 0.8.6 -> 0.8.7
- `peft` 0.19.0 -> 0.19.1
- `polars` 1.39.3 -> 1.40.1
- `polars-runtime-32` 1.39.3 -> 1.40.1
- `propcache` 0.4.1 -> 0.5.2
- `proto-plus` 1.27.2 -> 1.28.0
- `pybind11` 3.0.3 -> 3.0.4
- `pydantic` 2.13.1 -> 2.13.4
- `pydantic-settings` 2.13.1 -> 2.14.1
- `pydantic_core` 2.46.1 -> 2.46.4
- `python-multipart` 0.0.26 -> 0.0.28
- `pytz` 2026.1.post1 -> 2026.2
- `regex` 2026.4.4 -> 2026.5.9
- `requests` 2.33.1 -> 2.34.0
- `rich-toolkit` 0.19.7 -> 0.19.9
- `s3transfer` 0.16.0 -> 0.17.0
- `sentence-transformers` 5.4.1 -> 5.5.0
- `sentry-sdk` 2.58.0 -> 2.60.0
- `skops` 0.13.0 -> 0.14.0
- `sse-starlette` 3.3.4 -> 3.4.4
- `tbb` 2022.3.1 -> 2023.0.0
- `tbb-devel` 2022.3.1 -> 2023.0.0
- `tcmlib` 1.4.1 -> 1.5.0
- `tensorstore` 0.1.82 -> 0.1.83
- `timm` 1.0.26 -> 1.0.27
- `torch` 2.10.0+rocm7.0.lumi.aif.20260415153022 -> 2.10.0+rocm7.0.lumi.aif.20260513142306
- `traitlets` 5.14.3 -> 5.15.0
- `trl` 1.1.0 -> 1.4.0
- `typer` 0.24.1 -> 0.25.1
- `tzdata` 2026.1 -> 2026.2
- `ultralytics-opencv-headless` 8.4.37 -> 8.4.50
- `ultralytics-thop` 2.0.18 -> 2.0.19
- `umf` 1.0.3 -> 1.1.0
- `urllib3` 2.6.3 -> 2.7.0
- `uvicorn` 0.44.0 -> 0.46.0
- `vllm` 0.19.0+lumi.aif.gfx90a.2a69949 -> 0.20.1+lumi.aif.gfx90a.132765e
- `wandb` 0.26.0 -> 0.26.1
- `wcwidth` 0.6.0 -> 0.7.0
- `wheel` 0.46.3 -> 0.47.0
- `xgrammar` 0.1.33 -> 0.2.0
- `xxhash` 3.6.0 -> 3.7.0
- `zarr` 3.1.6 -> 3.2.1

**Added:**

- `apache-tvm-ffi` 0.1.11
