# Release notes for lumi-multitorch-u24r70f21m50t210-20260807_115122

**Release links:**
- [Release README](https://github.com/lumi-ai-factory/laifs-container-recipes-release-artifacts/blob/main/lumi-multitorch-u24r70f21m50t210-20260807_115122/lumi-multitorch-u24r70f21m50t210-20260807_115122.md)
- [GitHub release](https://github.com/lumi-ai-factory/laifs-container-recipes/releases/tag/lumi-multitorch-u24r70f21m50t210-20260807_115122)
- [Recipe changes](https://github.com/lumi-ai-factory/laifs-container-recipes/compare/lumi-multitorch-u24r70f21m50t210-20260731_122833...lumi-multitorch-u24r70f21m50t210-20260807_115122)
- [Known issues](https://github.com/lumi-ai-factory/laifs-container-recipes/issues?q=label%3Alumi-multitorch-u24r70f21m50t210-20260807_115122)

## Major updates

- Transformer Engine in `plus` image installed from a fork with a patched version check, enabling
  the use of LUMI AIF-installed Flash Attention 2 as the attention backend.

## Package changes

Comprehensive list of package changes comparing the following releases:

- `lumi-multitorch-full-u24r70f21m50t210-20260731_122833.json`
- `lumi-multitorch-full-u24r70f21m50t210-20260807_115122.json`

### Apt package changes

**Changed:**

- `linux-libc-dev` 6.8.0-136.136 -> 6.8.0-137.137

### Pip package changes

**Changed:**

- `GitPython` 3.1.57 -> 3.1.58
- `Mako` 1.3.12 -> 1.4.1
- `alembic` 1.18.5 -> 1.19.0
- `anthropic` 0.120.2 -> 0.121.0
- `apache-tvm-ffi` 0.1.13 -> 0.1.13.post2
- `boto3` 1.43.62 -> 1.43.67
- `botocore` 1.43.62 -> 1.43.67
- `cachetools` 7.1.6 -> 7.1.7
- `cbor2` 6.1.3 -> 6.1.4
- `cffi` 2.1.0 -> 2.1.1
- `databricks-sdk` 0.123.0 -> 0.125.0
- `google-api-core` 2.33.0 -> 2.34.0
- `google-auth` 2.56.2 -> 2.56.3
- `google-cloud-core` 2.6.0 -> 2.6.1
- `google-cloud-storage` 3.13.0 -> 3.13.1
- `google-resumable-media` 2.10.0 -> 2.10.1
- `googleapis-common-protos` 1.75.0 -> 1.75.1
- `hf-xet` 1.5.2 -> 1.6.0
- `hiredis` 3.4.0 -> 3.4.1
- `huey` 3.3.1 -> 3.3.4
- `huggingface_hub` 1.26.0 -> 1.27.0
- `ipython` 9.16.0 -> 9.16.1
- `jupyter_builder` 1.2.0 -> 1.2.2
- `marimo` 0.23.15 -> 0.23.16
- `mlflow` 3.15.0 -> 3.15.1
- `mlflow-skinny` 3.15.0 -> 3.15.1
- `mlflow-tracing` 3.15.0 -> 3.15.1
- `nbformat` 5.10.4 -> 5.11.0
- `nltk` 3.10.0 -> 3.10.2
- `onnxslim` 0.1.94 -> 0.1.95
- `openai` 2.52.0 -> 2.53.0
- `packaging` 26.2 -> 26.3
- `polars` 1.43.1 -> 1.43.2
- `polars-runtime-32` 1.43.1 -> 1.43.2
- `proto-plus` 1.28.2 -> 1.28.3
- `pybind11` 3.0.4 -> 3.1.0
- `pydantic-settings` 2.14.2 -> 2.15.0
- `pymdown-extensions` 10.21.3 -> 11.0.1
- `rignore` 0.8.0 -> 0.8.1
- `sentence-transformers` 5.6.1 -> 5.7.0
- `soupsieve` 2.9.1 -> 2.9.2
- `sse-starlette` 3.4.6 -> 3.4.8
- `starlette` 1.3.1 -> 1.4.1
- `tensorstore` 0.1.84 -> 0.1.85
- `torch` 2.10.0+rocm7.0.lumi.aif.20260731144255 -> 2.10.0+rocm7.0.lumi.aif.20260807140531
- `tornado` 6.5.7 -> 6.5.8
- `traitlets` 5.16.0 -> 5.16.1
- `typer` 0.27.0 -> 0.27.1
- `ultralytics-opencv-headless` 8.4.113 -> 8.4.116
- `uvicorn` 0.52.0 -> 0.52.1

