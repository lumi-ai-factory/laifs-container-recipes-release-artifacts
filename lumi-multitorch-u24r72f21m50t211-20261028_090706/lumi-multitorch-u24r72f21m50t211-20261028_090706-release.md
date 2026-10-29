# Release notes for lumi-multitorch-u24r72f21m50t211-20261028_090706

**Release links:**
- [Release README](https://github.com/lumi-ai-factory/laifs-container-recipes-release-artifacts/blob/main/lumi-multitorch-u24r72f21m50t211-20261028_090706/lumi-multitorch-u24r72f21m50t211-20261028_090706.md)
- [GitHub release](https://github.com/lumi-ai-factory/laifs-container-recipes/releases/tag/lumi-multitorch-u24r72f21m50t211-20261028_090706)
- [Recipe changes](https://github.com/lumi-ai-factory/laifs-container-recipes/compare/lumi-multitorch-u24r72f21m50t211-20260929_104918...lumi-multitorch-u24r72f21m50t211-20261028_090706)
- [Known issues](https://github.com/lumi-ai-factory/laifs-container-recipes/issues?q=label%3Alumi-multitorch-u24r72f21m50t211-20261028_090706)

This is a security update release. It contains the same versions of ROCm, PyTorch and the other main components as [lumi-multitorch-u24r72f21m50t211-20260929_104918](https://github.com/lumi-ai-factory/laifs-container-recipes/releases/tag/lumi-multitorch-u24r72f21m50t211-20260929_104918), rebuilt with security fixes and updated packages.

## Security updates

### eMudhra Intermediate CA Compromise

The root certificate **emSign ECC Root CA - G3** must no longer be trusted (see the [incident page](https://emudhra.we-have-a-problem.com/)). Earlier images still trust it in all three of their CA stores. This release removes it from all of them:

- **System CA store**, used by e.g. curl, git and Python's ssl module: `ca-certificates` 20260601~24.04.1 -> **20260816ubuntu0.24.04.1**
- **certifi**, used by e.g. requests, huggingface_hub and vLLM: 2026.7.22 -> **2026.10.23**
- **pip**: 24.0 -> **26.2.2**.

### Ubuntu base image

- Ubuntu base image is now **[ubuntu:noble-20261024.1](https://hub.docker.com/layers/library/ubuntu/noble-20261024.1/)**, with security updates to e.g. `openssl`, `curl`, and `git`.

## Other changes

- Python packages installed from PyPI are updated to their latest compatible versions. See the list below.

## Package changes

Comprehensive list of package changes comparing the following releases:

- `lumi-multitorch-full-u24r72f21m50t211-20260929_104918.json`
- `lumi-multitorch-full-u24r72f21m50t211-20261028_090706.json`

### Apt package changes

**Changed:**

- `ca-certificates` 20260601~24.04.1 -> 20260816ubuntu0.24.04.1
- `curl` 8.5.0-2ubuntu10.15 -> 8.5.0-2ubuntu10.16
- `git` 1:2.43.0-1ubuntu7.3 -> 1:2.43.0-1ubuntu7.4
- `git-man` 1:2.43.0-1ubuntu7.3 -> 1:2.43.0-1ubuntu7.4
- `libapparmor1` 4.0.1really4.0.1-0ubuntu0.24.04.8 -> 4.0.1really4.0.1-0ubuntu0.24.04.9
- `libarchive13t64` 3.7.2-2ubuntu0.8 -> 3.7.2-2ubuntu0.9
- `libbrotli1` 1.1.0-2build2 -> 1.1.0-2ubuntu0.1
- `libcurl3t64-gnutls` 8.5.0-2ubuntu10.15 -> 8.5.0-2ubuntu10.16
- `libcurl4-openssl-dev` 8.5.0-2ubuntu10.15 -> 8.5.0-2ubuntu10.16
- `libcurl4t64` 8.5.0-2ubuntu10.15 -> 8.5.0-2ubuntu10.16
- `libfreetype6` 2.13.2+dfsg-1ubuntu0.1 -> 2.13.2+dfsg-1ubuntu0.2
- `libgbm1` 25.2.8-0ubuntu0.24.04.2 -> 25.2.8-0ubuntu0.24.04.4
- `libgl1-mesa-dri` 25.2.8-0ubuntu0.24.04.2 -> 25.2.8-0ubuntu0.24.04.4
- `libglib2.0-0t64` 2.80.0-6ubuntu3.9 -> 2.80.0-6ubuntu3.10
- `libglx-mesa0` 25.2.8-0ubuntu0.24.04.2 -> 25.2.8-0ubuntu0.24.04.4
- `liblzma5` 5.6.1+really5.4.5-1ubuntu0.3 -> 5.6.1+really5.4.5-1ubuntu0.4
- `libpng-dev` 1.6.43-5ubuntu0.6 -> 1.6.43-5ubuntu0.7
- `libpng16-16t64` 1.6.43-5ubuntu0.6 -> 1.6.43-5ubuntu0.7
- `librsvg2-2` 2.58.0+dfsg-1build1 -> 2.58.0+dfsg-1ubuntu0.1
- `libssl3t64` 3.0.13-0ubuntu3.15 -> 3.0.13-0ubuntu3.16
- `libsystemd0` 255.4-1ubuntu8.17 -> 255.4-1ubuntu8.18
- `libudev1` 255.4-1ubuntu8.17 -> 255.4-1ubuntu8.18
- `libx11-6` 2:1.8.7-1build1 -> 2:1.8.7-1ubuntu0.1
- `libx11-data` 2:1.8.7-1build1 -> 2:1.8.7-1ubuntu0.1
- `libx11-dev` 2:1.8.7-1build1 -> 2:1.8.7-1ubuntu0.1
- `libx11-xcb1` 2:1.8.7-1build1 -> 2:1.8.7-1ubuntu0.1
- `libxml2` 2.9.14+dfsg-1.3ubuntu3.9 -> 2.9.14+dfsg-1.3ubuntu3.10
- `libxml2-dev` 2.9.14+dfsg-1.3ubuntu3.9 -> 2.9.14+dfsg-1.3ubuntu3.10
- `linux-libc-dev` 6.8.0-142.142 -> 6.8.0-147.147
- `mesa-common-dev` 25.2.8-0ubuntu0.24.04.2 -> 25.2.8-0ubuntu0.24.04.4
- `mesa-libgallium` 25.2.8-0ubuntu0.24.04.2 -> 25.2.8-0ubuntu0.24.04.4
- `openssl` 3.0.13-0ubuntu3.15 -> 3.0.13-0ubuntu3.16
- `sudo` 1.9.15p5-3ubuntu5.24.04.3 -> 1.9.15p5-3ubuntu5.24.04.4
- `tmux` 3.4-1ubuntu0.1 -> 3.4-1ubuntu0.2
- `tzdata` 2026c-0ubuntu0.24.04.1 -> 2026e-0ubuntu0.24.04.1
- `xz-utils` 5.6.1+really5.4.5-1ubuntu0.3 -> 5.6.1+really5.4.5-1ubuntu0.4
- `zlib1g` 1:1.3.dfsg-3.1ubuntu2.2 -> 1:1.3.dfsg-3.1ubuntu2.3
- `zlib1g-dev` 1:1.3.dfsg-3.1ubuntu2.2 -> 1:1.3.dfsg-3.1ubuntu2.3

### Pip package changes

**Changed:**

- `GitPython` 3.1.62 -> 3.2.1
- `Markdown` 3.11 -> 3.11.2
- `MarkupSafe` 3.0.3 -> 3.0.4
- `SQLAlchemy` 2.1.1 -> 2.1.6
- `absl-py` 2.5.0 -> 2.5.1
- `aiohttp` 3.14.3 -> 3.14.5
- `alembic` 1.20.0 -> 1.20.1
- `anthropic` 1.9.0 -> 2.3.0
- `async-lru` 2.3.0 -> 2.4.0
- `azure-identity` 1.25.3 -> 1.27.0
- `azure-storage-blob` 12.30.3 -> 12.31.0
- `blake3` 1.0.10 -> 1.0.11
- `boto3` 1.43.105 -> 1.43.121
- `botocore` 1.43.105 -> 1.43.121
- `cachetools` 7.2.0 -> 7.2.6
- `cbor2` 6.1.4 -> 6.1.5
- `certifi` 2026.7.22 -> 2026.10.23
- `charset-normalizer` 3.5.1 -> 3.5.2
- `cmake` 4.4.3 -> 4.4.4
- `cryptography` 50.0.1 -> 50.0.2
- `databricks-sdk` 0.143.0 -> 0.157.0
- `dnspython` 2.8.0 -> 2.9.0
- `executing` 2.2.1 -> 2.3.0
- `fastsafetensors` 0.4.0 -> 0.5.0
- `filelock` 4.0.6 -> 4.2.4
- `fonttools` 4.66.0 -> 4.68.0
- `google-api-core` 2.40.0 -> 2.43.1
- `google-auth` 2.59.0 -> 2.62.0
- `google-cloud-storage` 3.15.1 -> 3.17.1
- `googleapis-common-protos` 1.75.4 -> 1.76.0
- `hf-xet` 1.6.0 -> 1.7.0
- `hiredis` 3.4.2 -> 3.5.0
- `httpcore2` 2.13.1 -> 2.16.0
- `httptools` 0.8.0 -> 0.9.0
- `httpx2` 2.13.1 -> 2.16.0
- `huey` 3.4.0 -> 3.5.3
- `ijson` 3.5.1 -> 3.6.0
- `importlib_metadata` 9.0.1 -> 9.1.0
- `iniconfig` 2.3.0 -> 2.3.1
- `intel-cmplr-lib-ur` 2026.1.2 -> 2026.2.0
- `intel-openmp` 2026.1.2 -> 2026.2.0
- `ipykernel` 7.3.0 -> 7.4.0
- `jedi` 0.20.0 -> 0.20.1
- `jiter` 0.17.0 -> 0.18.0
- `json5` 0.15.0 -> 0.17.3
- `jsonpointer` 3.1.1 -> 3.6
- `jupyter_builder` 1.2.3 -> 1.2.4
- `loro` 1.16.2 -> 1.17.1
- `marimo` 0.25.0 -> 0.25.2
- `mcp` 2.2.0 -> 2.3.0
- `mcp-types` 2.2.0 -> 2.3.0
- `mistral_common` 1.12.0 -> 1.13.0
- `mistune` 3.3.4 -> 3.4.0
- `mkl-include` 2026.1.0 -> 2026.2.0
- `mkl-static` 2026.1.0 -> 2026.2.0
- `mlflow` 3.16.1 -> 3.17.2
- `mlflow-skinny` 3.16.1 -> 3.17.2
- `mlflow-tracing` 3.16.1 -> 3.17.2
- `msgpack` 1.2.3 -> 1.2.4
- `msgspec` 0.21.1 -> 0.22.0
- `multidict` 6.9.1 -> 7.2.1
- `narwhals` 2.26.0 -> 2.28.0
- `nbconvert` 7.17.1 -> 7.17.2
- `nest-asyncio2` 1.7.3 -> 1.7.4
- `nltk` 3.10.3 -> 3.10.4
- `numcodecs` 0.17.0 -> 0.17.1
- `onnx-ir` 1.0.0 -> 1.1.0
- `onnxslim` 0.1.97 -> 0.1.98
- `openai` 3.22.0 -> 3.40.0
- `opentelemetry-api` 1.45.0 -> 1.45.1
- `opentelemetry-exporter-http-transport` 0.66b0 -> 0.66b1
- `opentelemetry-exporter-otlp` 1.45.0 -> 1.45.1
- `opentelemetry-exporter-otlp-common` 0.66b0 -> 0.66b1
- `opentelemetry-exporter-otlp-proto-common` 1.45.0 -> 1.45.1
- `opentelemetry-exporter-otlp-proto-grpc` 1.45.0 -> 1.45.1
- `opentelemetry-exporter-otlp-proto-http` 1.45.0 -> 1.45.1
- `opentelemetry-proto` 1.45.0 -> 1.45.1
- `opentelemetry-sdk` 1.45.0 -> 1.45.1
- `opentelemetry-semantic-conventions` 0.66b0 -> 0.66b1
- `pandas` 3.0.6 -> 3.1.0
- `peft` 0.21.1 -> 0.21.2
- `pip` 24.0 -> 26.2.2
- `platformdirs` 4.12.1 -> 4.13.7
- `pluggy` 1.6.0 -> 1.7.0
- `polars` 1.44.2 -> 2.1.0
- `polars-runtime-32` 1.44.2 -> 2.1.0
- `pyasn1` 0.6.4 -> 0.6.5
- `pybase64` 1.5.0 -> 1.5.1
- `pycparser` 3.0 -> 3.12
- `pydantic` 2.13.5 -> 2.14.1
- `pydantic-settings` 2.15.0 -> 2.16.2
- `pydantic_core` 2.46.5 -> 2.50.1
- `pytest` 9.1.1 -> 9.2.0
- `pytest-asyncio` 1.4.0 -> 1.4.1
- `python-dotenv` 1.2.3 -> 1.2.4
- `pytz` 2026.4 -> 2026.5
- `rich-toolkit` 0.20.5 -> 0.20.6
- `rpds-py` 2026.6.3 -> 2026.9.1
- `s3transfer` 0.19.2 -> 0.19.3
- `sentence-transformers` 6.1.0 -> 6.2.0
- `sentry-sdk` 2.71.0 -> 2.73.0
- `setproctitle` 1.3.7 -> 1.3.8
- `soupsieve` 2.10 -> 3.0.4
- `sse-starlette` 3.5.0 -> 3.6.0
- `starlette` 1.7.0 -> 1.10.0
- `tbb` 2023.1.0 -> 2023.2.0
- `tbb-devel` 2023.1.0 -> 2023.2.0
- `tcmlib` 1.5.0 -> 1.6.0
- `tensorstore` 0.1.85 -> 0.1.86
- `tomlkit` 0.15.1 -> 0.15.2
- `torch` 2.11.0+rocm7.2.lumi.aif.20260929120822 -> 2.11.0+rocm7.2.lumi.aif.20261028104748
- `tornado` 6.5.10 -> 6.6
- `trl` 1.14.1 -> 1.16.0
- `truststore` 0.10.4 -> 0.10.5
- `typer` 0.27.2 -> 0.27.3
- `tzdata` 2026.4 -> 2026.6
- `ultralytics-opencv-headless` 8.4.165 -> 8.4.191
- `ultralytics-platform` 0.1.70 -> 0.1.100
- `ultralytics-thop` 2.2.1 -> 2.2.3
- `umf` 1.1.0 -> 1.2.0
- `uvloop` 0.22.1 -> 0.23.0
- `vcs-versioning` 2.5.0 -> 2.6.0
- `wandb` 0.30.0 -> 0.31.0
- `wcwidth` 0.9.1 -> 0.9.4
- `websockets` 17.1 -> 17.3
- `wrapt` 2.5.0 -> 2.5.1
- `xxhash` 4.0.1 -> 4.0.2
- `zarr` 3.4.0 -> 3.4.2
- `zipp` 4.1.0 -> 4.1.2

**Added:**

- `cwevals` 0.0.1b1
- `distro` 1.9.0

**Removed:**

- `onemkl-license` 2026.1.0

