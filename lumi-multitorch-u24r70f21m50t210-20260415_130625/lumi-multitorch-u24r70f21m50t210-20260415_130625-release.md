# Release notes for lumi-multitorch-u24r70f21m50t210-20260415_130625

**Release Links:**
- [Release README](https://github.com/lumi-ai-factory/laifs-container-recipes-release-artifacts/blob/main/lumi-multitorch-u24r70f21m50t210-20260415_130625/lumi-multitorch-u24r70f21m50t210-20260415_130625.md)
- [GitHub Release](https://github.com/lumi-ai-factory/laifs-container-recipes/releases/tag/lumi-multitorch-u24r70f21m50t210-20260415_130625)
- [Recipe Changes](https://github.com/lumi-ai-factory/laifs-container-recipes/compare/lumi-multitorch-u24r64f21m43t29-20260319_153422...lumi-multitorch-u24r70f21m50t210-20260415_130625)
- [Known Issues](https://github.com/lumi-ai-factory/laifs-container-recipes/issues?q=label%3Alumi-multitorch-u24r70f21m50t210-20260415_130625)

This release introduces major software component updates and changes to the LUMI
AI Factory container collection `lumi-multitorch`. Key highlights of this
release include:

- Upgrade to **ROCm 7.0.2**, delivering improved performance and compatibility
  to more recent versions of different libraries and frameworks.
- **PyTorch 2.10.0**, built locally with MPI support enabled, and with patches
  enable MPI use with AMD GPU's and MPICH.
- **MPICH 5.0.0**, including Yaksa built specificially for MI250x GPUs (gfx90a)
  GPUs to resolve occasional  "Invalid device function" errors.
- Transition from deprecated ROCm port of AWS netplugin (`aws-ofi-rccl`) to
  the AWS upstream `aws-ofi-nccl` version.
- New experimental image (`lumi-multitorch-plus`) for testing advanced/unstable
  features.

## Major Updates

### ROCm 7.0.2
- Upgraded from **ROCm 6.4.4 to 7.0.2**, with all ROCm components and packages
  depending on ROCm updated accordingly.
- Includes a locally built, patched version of `smi_lib`, which fixes a
  double-free bug that causes crashes in the upstream ROCm 7.0.x releases.
  Packaged as a Debian package to satisfy all APT dependency requirements.
- Improves GPU performance and is required by some more recent versions
  of various ML libraries and frameworks.

### PyTorch 2.10.0
- Upgraded from **PyTorch 2.9.1 to 2.10.0**, a significant change with many
  downstream impacts.
- Built locally from source with MPI backend enabled. Includes a custom patch
  which enables MPI support for AMD GPUs and MPI support with MPICH.
- The MPI support should be considered experimental while the RCCL backend
  is expected to be stable.
- Many packages, such as for example vLLM, have started requiring  PyTorch 
  version 2.10+, which makes this upgrade important.

### MPICH 5.0.0
- Upgraded from **MPICH 4.3.2 to 5.0.0**.
- Yaksa component is now compiled explicitly for LUMI's MI250x (gfx90a) GPUs.

### Transition from aws-ofi-rccl to aws-ofi-nccl
- Replaced the deprecated `aws-ofi-rccl` with upstream `aws-ofi-nccl`.
- The ROCm port `aws-ofi-rccl` has been deprecated and is not functional with
  ROCm 7+ versions

### Locally Built hwloc
- Switched from the default Ubuntu package to a locally built version (v2.13.0).
- Split into three packages (`libhwloc-dev`, `libhwloc-plugins`, `libhwloc15`)
  to satisfy dependencies.
- The included version is built with HIP support (unlike the Ubuntu version),
  a new requirement stemming from the transition to `aws-ofi-nccl`.

## Other changes

- Introducing a new **Plus image** (`lumi-multitorch-plus`)
  - A technology preview for testing advanced/unstable features and packages
    considered to be added into the Full image.
  - Builds on top of the Full image and currently adds only an experimental
    build of TransformersEngine for testing purposes
  - The Plus image is not intended for production use. Features may be removed
    or changed without warning in future releases.
  - See the main README for more information.
- Locally built Ubuntu packages now use `/usr/lib/x86_64-linux-gnu` for
  libraries for consistency with the official Ubuntu packages.
- New packages in the Full image:`h5py`, `mlflow`, and `sentence-transformers`.
- Updates to several locally built packages, including Apex, vLLM, xFormers,
  and others, as well as to several PyPI originated packages. See the
  complete list of updates below.
- `ultralytics` has been replaced with `ultralytics-opencv-headless` to avoid
  conflicts caused by the Ubuntu versions of `OpenMPI` and `libfabric1`, which
  have now been removed from the images. This change led to the removal of a
  large amount of dependencies, as reflected in the package changes lists below.
- Improved internal tooling, including a templated `release.sh` script for
  consistent release creation.
- Added release notes (this file).

## Package changes

Comprehensive list of package changes comparing the following releases:

- `lumi-multitorch-full-u24r64f21m43t29-20260319_153422`
- `lumi-multitorch-full-u24r70f21m50t210-20260415_130625`

### APT Package Changes

**Changed:**

- `amd-smi-lib6.4.4` 25.5.1.60404-129.24.04 -> 26.0.2.70002-56.24.04
- `comgr6.4.4` 3.0.0.60404-129.24.04 -> 3.0.0.70002-56.24.04
- `composablekernel-dev6.4.4` 1.1.0.60404-129.24.04 -> 1.1.0.70002-56.24.04
- `half6.4.4` 1.12.0.60404-129.24.04 -> 1.12.0.70002-56.24.04
- `hip-dev6.4.4` 6.4.43484.60404-129.24.04 -> 7.0.51831.70002-56.24.04
- `hip-doc6.4.4` 6.4.43484.60404-129.24.04 -> 7.0.51831.70002-56.24.04
- `hip-runtime-amd6.4.4` 6.4.43484.60404-129.24.04 -> 7.0.51831.70002-56.24.04
- `hip-samples6.4.4` 6.4.43484.60404-129.24.04 -> 7.0.51831.70002-56.24.04
- `hipblas-common-dev6.4.4` 1.0.0.60404-129.24.04 -> 1.2.0.70002-56.24.04
- `hipblas-dev6.4.4` 2.4.0.60404-129.24.04 -> 3.0.2.70002-56.24.04
- `hipblas6.4.4` 2.4.0.60404-129.24.04 -> 3.0.2.70002-56.24.04
- `hipblaslt-dev6.4.4` 0.12.1.60404-129.24.04 -> 1.0.0.70002-56.24.04
- `hipblaslt6.4.4` 0.12.1.60404-129.24.04 -> 1.0.0.70002-56.24.04
- `hipcc6.4.4` 1.1.1.60404-129.24.04 -> 1.1.1.70002-56.24.04
- `hipcub-dev6.4.4` 3.4.0.60404-129.24.04 -> 4.0.0.70002-56.24.04
- `hipfft-dev6.4.4` 1.0.18.60404-129.24.04 -> 1.0.20.70002-56.24.04
- `hipfft6.4.4` 1.0.18.60404-129.24.04 -> 1.0.20.70002-56.24.04
- `hipify-clang6.4.4` 19.0.0.60404-129.24.04 -> 20.0.0.70002-56.24.04
- `hiprand-dev6.4.4` 2.12.0.60404-129.24.04 -> 3.0.0.70002-56.24.04
- `hiprand6.4.4` 2.12.0.60404-129.24.04 -> 3.0.0.70002-56.24.04
- `hipsolver-dev6.4.4` 2.4.0.60404-129.24.04 -> 3.0.0.70002-56.24.04
- `hipsolver6.4.4` 2.4.0.60404-129.24.04 -> 3.0.0.70002-56.24.04
- `hipsparse-dev6.4.4` 3.2.0.60404-129.24.04 -> 4.0.1.70002-56.24.04
- `hipsparse6.4.4` 3.2.0.60404-129.24.04 -> 4.0.1.70002-56.24.04
- `hipsparselt-dev6.4.4` 0.2.3.60404-129.24.04 -> 0.2.4.70002-56.24.04
- `hipsparselt6.4.4` 0.2.3.60404-129.24.04 -> 0.2.4.70002-56.24.04
- `hiptensor-dev6.4.4` 1.5.0.60404-129.24.04 -> 2.0.0.70002-56.24.04
- `hiptensor6.4.4` 1.5.0.60404-129.24.04 -> 2.0.0.70002-56.24.04
- `hsa-amd-aqlprofile6.4.4` 1.0.0.60404-129.24.04 -> 1.0.0.70002-56.24.04
- `hsa-rocr-dev6.4.4` 1.15.0.60404-129.24.04 -> 1.18.0.70002-56.24.04
- `hsa-rocr6.4.4` 1.15.0.60404-129.24.04 -> 1.18.0.70002-56.24.04
- `libapparmor1` 4.0.1really4.0.1-0ubuntu0.24.04.5 -> 4.0.1really4.0.1-0ubuntu0.24.04.6
- `libarchive13t64` 3.7.2-2ubuntu0.5 -> 3.7.2-2ubuntu0.6
- `libgdk-pixbuf-2.0-0` 2.42.10+dfsg-3ubuntu3.2 -> 2.42.10+dfsg-3ubuntu3.3
- `libgdk-pixbuf2.0-common` 2.42.10+dfsg-3ubuntu3.2 -> 2.42.10+dfsg-3ubuntu3.3
- `libhwloc-plugins` 2.10.0-1build1 -> 2.13.0
- `libhwloc15` 2.10.0-1build1 -> 2.13.0
- `libssl3t64` 3.0.13-0ubuntu3.7 -> 3.0.13-0ubuntu3.9
- `libsystemd-shared` 255.4-1ubuntu8.12 -> 255.4-1ubuntu8.15
- `libsystemd0` 255.4-1ubuntu8.12 -> 255.4-1ubuntu8.15
- `libtiff6` 4.5.1+git230720-4ubuntu2.4 -> 4.5.1+git230720-4ubuntu2.5
- `libudev1` 255.4-1ubuntu8.12 -> 255.4-1ubuntu8.15
- `linux-libc-dev` 6.8.0-106.106 -> 6.8.0-110.110
- `miopen-hip-dev6.4.4` 3.4.0.60404-129.24.04 -> 3.5.0.70002-56.24.04
- `miopen-hip6.4.4` 3.4.0.60404-129.24.04 -> 3.5.0.70002-56.24.04
- `mpich` 4.3.2 -> 5.0.0
- `openmp-extras-dev6.4.4` 18.63.0.60404-129.24.04 -> 20.70.0.70002-56.24.04
- `openmp-extras-runtime6.4.4` 18.63.0.60404-129.24.04 -> 20.70.0.70002-56.24.04
- `openssl` 3.0.13-0ubuntu3.7 -> 3.0.13-0ubuntu3.9
- `rccl-dev6.4.4` 2.22.3.60404-129.24.04 -> 2.26.6.70002-56.24.04
- `rccl6.4.4` 2.22.3.60404-129.24.04 -> 2.26.6.70002-56.24.04
- `rocalution-dev6.4.4` 3.2.3.60404-129.24.04 -> 4.0.0.70002-56.24.04
- `rocalution6.4.4` 3.2.3.60404-129.24.04 -> 4.0.0.70002-56.24.04
- `rocblas-dev6.4.4` 4.4.1.60404-129.24.04 -> 5.0.2.70002-56.24.04
- `rocblas6.4.4` 4.4.1.60404-129.24.04 -> 5.0.2.70002-56.24.04
- `rocfft-dev6.4.4` 1.0.32.60404-129.24.04 -> 1.0.34.70002-56.24.04
- `rocfft6.4.4` 1.0.32.60404-129.24.04 -> 1.0.34.70002-56.24.04
- `rocm-cmake6.4.4` 0.14.0.60404-129.24.04 -> 0.14.0.70002-56.24.04
- `rocm-core6.4.4` 6.4.4.60404-129.24.04 -> 7.0.2.70002-56.24.04
- `rocm-dbgapi6.4.4` 0.77.2.60404-129.24.04 -> 0.77.4.70002-56.24.04
- `rocm-debug-agent6.4.4` 2.0.4.60404-129.24.04 -> 2.1.0.70002-56.24.04
- `rocm-dev6.4.4` 6.4.4.60404-129.24.04 -> 7.0.2.70002-56.24.04
- `rocm-device-libs6.4.4` 1.0.0.60404-129.24.04 -> 1.0.0.70002-56.24.04
- `rocm-gdb6.4.4` 15.2.60404-129.24.04 -> 16.3.70002-56.24.04
- `rocm-libs6.4.4` 6.4.4.60404-129.24.04 -> 7.0.2.70002-56.24.04
- `rocm-llvm6.4.4` 19.0.0.25224.60404-129.24.04 -> 20.0.0.25385.70002-56.24.04
- `rocm-opencl-dev6.4.4` 2.0.0.60404-129.24.04 -> 2.0.0.70002-56.24.04
- `rocm-opencl6.4.4` 2.0.0.60404-129.24.04 -> 2.0.0.70002-56.24.04
- `rocm-smi-lib6.4.4` 7.7.0.60404-129.24.04 -> 7.8.0.70002-56.24.04
- `rocm-utils6.4.4` 6.4.4.60404-129.24.04 -> 7.0.2.70002-56.24.04
- `rocminfo6.4.4` 1.0.0.60404-129.24.04 -> 1.0.0.70002-56.24.04
- `rocprim-dev6.4.4` 3.4.1.60404-129.24.04 -> 4.0.1.70002-56.24.04
- `rocprofiler-dev6.4.4` 2.0.60404.60404-129.24.04 -> 2.0.70002.70002-56.24.04
- `rocprofiler-plugins6.4.4` 2.0.60404.60404-129.24.04 -> 2.0.70002.70002-56.24.04
- `rocprofiler-register6.4.4` 0.4.0.60404-129.24.04 -> 0.6.0.70002-56.24.04
- `rocprofiler-sdk-roctx6.4.4` 0.6.0-129.24.04 -> 1.0.0-56.24.04
- `rocprofiler-sdk6.4.4` 0.6.0-129.24.04 -> 1.0.0-56.24.04
- `rocprofiler6.4.4` 2.0.60404.60404-129.24.04 -> 2.0.70002.70002-56.24.04
- `rocrand-dev6.4.4` 3.3.0.60404-129.24.04 -> 4.0.0.70002-56.24.04
- `rocrand6.4.4` 3.3.0.60404-129.24.04 -> 4.0.0.70002-56.24.04
- `rocsolver-dev6.4.4` 3.28.2.60404-129.24.04 -> 3.30.1.70002-56.24.04
- `rocsolver6.4.4` 3.28.2.60404-129.24.04 -> 3.30.1.70002-56.24.04
- `rocsparse-dev6.4.4` 3.4.0.60404-129.24.04 -> 4.0.3.70002-56.24.04
- `rocsparse6.4.4` 3.4.0.60404-129.24.04 -> 4.0.3.70002-56.24.04
- `rocthrust-dev6.4.4` 3.3.0.60404-129.24.04 -> 4.0.0.70002-56.24.04
- `roctracer-dev6.4.4` 4.1.60404.60404-129.24.04 -> 4.1.70002.70002-56.24.04
- `roctracer6.4.4` 4.1.60404.60404-129.24.04 -> 4.1.70002.70002-56.24.04
- `rocwmma-dev6.4.4` 1.7.0.60404-129.24.04 -> 2.0.0.70002-56.24.04
- `systemd-dev` 255.4-1ubuntu8.12 -> 255.4-1ubuntu8.15
- `systemd` 255.4-1ubuntu8.12 -> 255.4-1ubuntu8.15
- `tzdata` 2025b-0ubuntu0.24.04.1 -> 2026a-0ubuntu0.24.04.1
- `udev` 255.4-1ubuntu8.12 -> 255.4-1ubuntu8.15

**Added:**

- `aws-ofi-nccl` 1.18.0-git-c1b89cc
- `ccache` 4.9.1-1
- `libhiredis1.1.0` 1.2.0-6ubuntu3
- `libhwloc-dev` 2.13.0
- `libopenblas-dev` 0.3.26+ds-1ubuntu0.1
- `libopenblas-pthread-dev` 0.3.26+ds-1ubuntu0.1
- `libopenblas0` 0.3.26+ds-1ubuntu0.1
- `libopenblas0-pthread` 0.3.26+ds-1ubuntu0.1
- `libpng-tools` 1.6.43-5ubuntu0.5
- `numactl` 2.0.18-1ubuntu0.24.04.1
- `ocl-icd-opencl-dev` 2.3.2-1build1
- `opencl-c-headers` 3.0.2023.12.14-1
- `opencl-clhpp-headers` 3.0.2023.12.14-1ubuntu1
- `rocprofiler-sdk-rocpd` 1.0.0-56.24.04

**Removed:**

- `aws-ofi-rccl` 1.4.0-1
- `gcc-11-base` 11.5.0-1ubuntu1.24.04.1
- `gdal-data` 3.8.4+dfsg-3ubuntu3
- `gdal-plugins` 3.8.4+dfsg-3ubuntu3
- `ibverbs-providers` 50.0-2ubuntu0.2
- `iso-codes` 4.16.0-1
- `libaec0` 1.1.2-1build1
- `libamd-comgr2` 6.0+git20231212.4510c28+dfsg-3build2
- `libamdhip64-5` 5.7.1-3
- `libarmadillo12` 1:12.6.7+dfsg-1build2
- `libarpack2t64` 3.9.1-1.1build2
- `libasan6` 11.5.0-1ubuntu1.24.04.1
- `libavcodec-dev` 7:6.1.1-3ubuntu5
- `libavformat-dev` 7:6.1.1-3ubuntu5
- `libavutil-dev` 7:6.1.1-3ubuntu5
- `libblas-dev` 3.12.0-3build1.1
- `libblas3` 3.12.0-3build1.1
- `libblkid-dev` 2.39.3-9ubuntu6.5
- `libblosc1` 1.21.5+ds-1build1
- `libcap2-bin` 1:2.66-5ubuntu2.2
- `libcfitsio10t64` 4.3.1-1.1build2
- `libcharls2` 2.4.2-2build2
- `libdc1394-dev` 2.2.6-4build1
- `libde265-0` 1.0.15-1build3
- `libdeflate-dev` 1.19-1build1.1
- `libdouble-conversion3` 3.3.0-1build1
- `libdw1t64` 0.190-1.1ubuntu0.1
- `libegl-mesa0` 25.2.8-0ubuntu0.24.04.1
- `libegl1` 1.7.0-1build1
- `libevdev2` 1.13.1+dfsg-1build1
- `libevent-pthreads-2.1-7t64` 2.1.12-stable-9ubuntu2
- `libexif-dev` 0.6.24-1build2
- `libexif12` 0.6.24-1build2
- `libfabric1` 1.17.0-3build2
- `libffi-dev` 3.4.6-1build1
- `libfreexl1` 2.0.0-1build2
- `libfyba0t64` 4.1.1-11build1
- `libgcc-11-dev` 11.5.0-1ubuntu1.24.04.1
- `libgd3` 2.3.3-9ubuntu5
- `libgdal34t64` 3.8.4+dfsg-3ubuntu3
- `libgdcm-dev` 3.0.22-2.1ubuntu1
- `libgdcm3.0t64` 3.0.22-2.1ubuntu1
- `libgeos-c1t64` 3.12.1-3build1
- `libgeos3.12.1t64` 3.12.1-3build1
- `libgeotiff5` 1.7.1-5build1
- `libgif7` 5.2.2-1ubuntu1
- `libgirepository-2.0-0` 2.80.0-6ubuntu3.8
- `libgl2ps1.4` 1.4.2+dfsg1-2build1
- `libglew2.2` 2.2.0-4build1
- `libglib2.0-bin` 2.80.0-6ubuntu3.8
- `libglib2.0-data` 2.80.0-6ubuntu3.8
- `libglib2.0-dev` 2.80.0-6ubuntu3.8
- `libglib2.0-dev-bin` 2.80.0-6ubuntu3.8
- `libgphoto2-6t64` 2.5.31-2.1ubuntu1
- `libgphoto2-dev` 2.5.31-2.1ubuntu1
- `libgphoto2-port12t64` 2.5.31-2.1ubuntu1
- `libgstreamer-plugins-base1.0-0` 1.24.2-1ubuntu0.3
- `libgstreamer1.0-0` 1.24.2-1ubuntu0.1
- `libgudev-1.0-0` 1:238-5ubuntu1
- `libhdf4-0-alt` 4.2.16-4build1
- `libhdf5-103-1t64` 1.10.10+repack-3.1ubuntu4
- `libhdf5-hl-100t64` 1.10.10+repack-3.1ubuntu4
- `libheif-plugin-aomdec` 1.17.6-1ubuntu4.2
- `libheif-plugin-libde265` 1.17.6-1ubuntu4.2
- `libheif1` 1.17.6-1ubuntu4.2
- `libhsa-runtime64-1` 5.7.1-2build1
- `libhsakmt1` 5.7.0-1build1
- `libibverbs1` 50.0-2ubuntu0.2
- `libice6` 2:1.0.10-1build3
- `libimath-3-1-29t64` 3.1.9-3.1ubuntu2
- `libimath-dev` 3.1.9-3.1ubuntu2
- `libinput-bin` 1.25.0-1ubuntu3.2
- `libinput10` 1.25.0-1ubuntu3.2
- `libjbig-dev` 2.1-6.1ubuntu2
- `libkmlbase1t64` 1.3.0-12build1
- `libkmldom1t64` 1.3.0-12build1
- `libkmlengine1t64` 1.3.0-12build1
- `liblapack-dev` 3.12.0-3build1.1
- `liblapack3` 3.12.0-3build1.1
- `liblept5` 1.82.0-3build4
- `liblerc-dev` 4.0.0+ds-4ubuntu2
- `libllvm17t64` 1:17.0.6-9ubuntu1
- `liblzma-dev` 5.6.1+really5.4.5-1ubuntu0.2
- `libmd4c0` 0.4.8-1build1
- `libminizip1t64` 1:1.3.dfsg-3.1ubuntu2.1
- `libmount-dev` 2.39.3-9ubuntu6.5
- `libmtdev1t64` 1.1.6-1.1build1
- `libmunge2` 0.5.15-4ubuntu0.1
- `libmysqlclient21` 8.0.45-0ubuntu0.24.04.1
- `libnetcdf19t64` 1:4.9.2-5ubuntu4
- `libnl-route-3-200` 3.7.0-0.3build1.1
- `libnspr4` 2:4.35-1.1build1
- `libnss3` 2:3.98-1ubuntu0.1
- `libodbc2` 2.3.12-1ubuntu0.24.04.1
- `libodbcinst2` 2.3.12-1ubuntu0.24.04.1
- `libogdi4.1` 4.1.1+ds-3build1
- `libopencv-calib3d-dev` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-calib3d406t64` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-contrib-dev` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-contrib406t64` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-core-dev` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-core406t64` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-dev` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-dnn-dev` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-dnn406t64` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-features2d-dev` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-features2d406t64` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-flann-dev` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-flann406t64` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-highgui-dev` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-highgui406t64` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-imgcodecs-dev` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-imgcodecs406t64` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-imgproc-dev` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-imgproc406t64` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-ml-dev` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-ml406t64` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-objdetect-dev` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-objdetect406t64` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-photo-dev` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-photo406t64` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-shape-dev` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-shape406t64` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-stitching-dev` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-stitching406t64` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-superres-dev` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-superres406t64` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-video-dev` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-video406t64` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-videoio-dev` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-videoio406t64` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-videostab-dev` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-videostab406t64` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-viz-dev` 4.6.0+dfsg-13.1ubuntu1
- `libopencv-viz406t64` 4.6.0+dfsg-13.1ubuntu1
- `libopenexr-3-1-30` 3.1.5-5.1build3
- `libopenexr-dev` 3.1.5-5.1build3
- `libopengl0` 1.7.0-1build1
- `libopenmpi3t64` 4.1.6-7ubuntu2
- `liborc-0.4-0t64` 1:0.4.38-1ubuntu0.1
- `libpmix2t64` 5.0.1-4.1build1
- `libpoppler134` 24.02.0-1ubuntu9.8
- `libpq5` 16.13-0ubuntu0.24.04.1
- `libproj25` 9.4.0-1build2
- `libprotobuf32t64` 3.21.12-8.2ubuntu0.3
- `libpsm-infinipath1` 3.3+20.604758e7-6.3build1
- `libpsm2-2` 11.2.185-2build1
- `libqhull-r8.0` 2020.2-6build1
- `libqt5core5t64` 5.15.13+dfsg-1ubuntu1
- `libqt5dbus5t64` 5.15.13+dfsg-1ubuntu1
- `libqt5gui5t64` 5.15.13+dfsg-1ubuntu1
- `libqt5network5t64` 5.15.13+dfsg-1ubuntu1
- `libqt5opengl5t64` 5.15.13+dfsg-1ubuntu1
- `libqt5test5t64` 5.15.13+dfsg-1ubuntu1
- `libqt5widgets5t64` 5.15.13+dfsg-1ubuntu1
- `libraw1394-dev` 2.1.2-2build3
- `librdmacm1t64` 50.0-2ubuntu0.2
- `librttopo1` 1.1.0-3build2
- `libsharpyuv-dev` 1.3.2-0.4build3
- `libsm6` 2:1.2.3-1build3
- `libsocket++1` 1.12.13+git20131030.5d039ba-1build1
- `libspatialite8t64` 5.1.0-3build1
- `libstdc++-11-dev` 11.5.0-1ubuntu1.24.04.1
- `libsuperlu6` 6.0.1+dfsg1-1build1
- `libswresample-dev` 7:6.1.1-3ubuntu5
- `libswscale-dev` 7:6.1.1-3ubuntu5
- `libsz2` 1.1.2-1build1
- `libtbb-dev` 2021.11.0-2ubuntu2
- `libtbb12` 2021.11.0-2ubuntu2
- `libtbbbind-2-5` 2021.11.0-2ubuntu2
- `libtbbmalloc2` 2021.11.0-2ubuntu2
- `libtcl8.6` 8.6.14+dfsg-1build1
- `libtesseract5` 5.3.4-1build5
- `libtiff-dev` 4.5.1+git230720-4ubuntu2.4
- `libtiffxx6` 4.5.1+git230720-4ubuntu2.4
- `libtk8.6` 8.6.14-1build1
- `libtsan0` 11.5.0-1ubuntu1.24.04.1
- `libucx0` 1.16.0+ds-5ubuntu1
- `liburiparser1` 0.9.7+dfsg-2build1
- `libvtk9.1t64` 9.1.0+really9.1.0+dfsg2-7.1build3
- `libwacom-common` 2.10.0-2
- `libwacom9` 2.10.0-2
- `libwebp-dev` 1.3.2-0.4build3
- `libwebpdecoder3` 1.3.2-0.4build3
- `libwebpdemux2` 1.3.2-0.4build3
- `libxcb-icccm4` 0.4.1-1.1build3
- `libxcb-image0` 0.4.0-2build1
- `libxcb-keysyms1` 0.4.0-1build4
- `libxcb-render-util0` 0.3.9-1build4
- `libxcb-util1` 0.4.0-1build3
- `libxcb-xinerama0` 1.15-1ubuntu2
- `libxcb-xinput0` 1.15-1ubuntu2
- `libxcb-xkb1` 1.15-1ubuntu2
- `libxerces-c3.2t64` 3.2.4+debian-1.2ubuntu2
- `libxft2` 2.3.6-1build1
- `libxkbcommon-x11-0` 1.6.0-1build1
- `libxnvctrl0` 510.47.03-0ubuntu4.24.04.1
- `libxpm4` 1:3.5.17-1build2
- `mysql-common` 5.8+1.1.0build1
- `proj-data` 9.4.0-1build2
- `unixodbc-common` 2.3.12-1ubuntu0.24.04.1
- `uuid-dev` 2.39.3-9ubuntu6.5

### PyPI Package Changes

**Changed:**

- `Pygments` 2.19.2 -> 2.20.0
- `Werkzeug` 3.1.6 -> 3.1.8
- `aiohttp` 3.13.3 -> 3.13.5
- `amdsmi` 25.5.1+41065ee6 -> 26.0.2+39589fda
- `anthropic` 0.86.0 -> 0.95.0
- `anyio` 4.12.1 -> 4.13.0
- `apex` 1.9.0+lumi.aif.gfx90a.e37ed12 -> 1.10.0+lumi.aif.gfx90a.73423b4
- `auto-round` 0.10.2 -> 0.12.2
- `boto3` 1.42.72 -> 1.42.89
- `botocore` 1.42.72 -> 1.42.89
- `cbor2` 5.8.0 -> 5.9.0
- `charset-normalizer` 3.4.6 -> 3.4.7
- `click` 8.3.1 -> 8.3.2
- `compressed-tensors` 0.14.1a20260317 -> 0.15.1a20260414
- `cryptography` 46.0.5 -> 46.0.7
- `datasets` 4.8.2 -> 4.8.4
- `docstring_parser` 0.17.0 -> 0.18.0
- `fastapi` 0.135.1 -> 0.135.3
- `fastapi-cloud-cli` 0.15.0 -> 0.17.0
- `fastar` 0.8.0 -> 0.11.0
- `filelock` 3.25.2 -> 3.28.0
- `google-api-core` 2.30.0 -> 2.30.3
- `google-auth` 2.49.1 -> 2.49.2
- `google-cloud-core` 2.5.0 -> 2.5.1
- `google-cloud-storage` 3.10.0 -> 3.10.1
- `google-resumable-media` 2.8.0 -> 2.8.2
- `googleapis-common-protos` 1.73.0 -> 1.74.0
- `hf-xet` 1.4.2 -> 1.4.3
- `intel-cmplr-lib-rt` 2025.3.2 -> 2025.3.3
- `intel-cmplr-lib-ur` 2025.3.2 -> 2025.3.3
- `intel-cmplr-lic-rt` 2025.3.2 -> 2025.3.3
- `intel-sycl-rt` 2025.3.2 -> 2025.3.3
- `ipython` 9.11.0 -> 9.12.0
- `jiter` 0.13.0 -> 0.14.0
- `json5` 0.13.0 -> 0.14.0
- `jsonpointer` 3.0.0 -> 3.1.1
- `jupyter-lsp` 2.3.0 -> 2.3.1
- `mcp` 1.26.0 -> 1.27.0
- `mistral_common` 1.10.0 -> 1.11.0
- `msgspec` 0.20.0 -> 0.21.1
- `nbconvert` 7.17.0 -> 7.17.1
- `nltk` 3.9.3 -> 3.9.4
- `numpy` 2.2.6 -> 2.1.3
- `nvidia-ml-py` 13.590.48 -> 13.595.45
- `openai` 2.29.0 -> 2.32.0
- `packaging` 26.0 -> 26.1
- `pandas` 3.0.1 -> 2.3.3
- `peft` 0.18.1 -> 0.19.0
- `pillow` 12.1.1 -> 12.2.0
- `platformdirs` 4.9.4 -> 4.9.6
- `polars` 1.39.2 -> 1.39.3
- `polars-runtime-32` 1.39.2 -> 1.39.3
- `prometheus_client` 0.24.1 -> 0.25.0
- `proto-plus` 1.27.1 -> 1.27.2
- `pybind11` 3.0.2 -> 3.0.3
- `pydantic` 2.12.5 -> 2.13.1
- `pydantic_core` 2.41.5 -> 2.46.1
- `pytest` 9.0.2 -> 9.0.3
- `python-json-logger` 4.0.0 -> 4.1.0
- `python-multipart` 0.0.22 -> 0.0.26
- `redis` 7.3.0 -> 7.4.0
- `regex` 2026.2.28 -> 2026.4.4
- `requests` 2.32.5 -> 2.33.1
- `rich` 14.3.3 -> 15.0.0
- `runai-model-streamer` 0.15.3 -> 0.15.7
- `runai-model-streamer-gcs` 0.15.3 -> 0.15.7
- `runai-model-streamer-s3` 0.15.3 -> 0.15.7
- `sentry-sdk` 2.55.0 -> 2.58.0
- `setuptools-scm` 9.2.2 -> 10.0.5
- `sse-starlette` 3.3.3 -> 3.3.4
- `timm` 1.0.25 -> 1.0.26
- `torch` 2.9.1+rocm6.4 -> 2.10.0+rocm7.0.lumi.aif.20260415153022
- `torchaudio` 2.9.1+rocm6.4 -> 2.10.0+rocm7.0
- `torchvision` 0.24.1+rocm6.4 -> 0.25.0+rocm7.0
- `triton` 3.5.1 -> 3.6.0
- `trl` 0.29.0 -> 1.1.0
- `tzdata` 2025.3 -> 2026.1
- `uvicorn` 0.42.0 -> 0.44.0
- `vllm` 0.16.0+lumi.aif.gfx90a.89a77b1 -> 0.19.0+lumi.aif.gfx90a.2a69949
- `wandb` 0.25.1 -> 0.26.0
- `xformers` 0.0.34+lumi.aif.gfx90a.41531ce -> 0.0.35+lumi.aif.gfx90a.03b91d7
- `xgrammar` 0.1.29 -> 0.1.33
- `zarr` 3.1.5 -> 3.1.6

**Added:**

- `Mako` 1.3.11
- `SQLAlchemy` 2.0.49
- `alembic` 1.18.4
- `amd-quark` 0.11.1
- `azure-core` 1.39.0
- `azure-identity` 1.25.3
- `azure-storage-blob` 12.28.0
- `build` 1.4.3
- `colorama` 0.4.6
- `databricks-sdk` 0.102.0
- `docker` 7.1.0
- `flask-cors` 6.0.2
- `graphene` 3.4.3
- `graphql-core` 3.2.8
- `graphql-relay` 3.2.0
- `greenlet` 3.4.0
- `gunicorn` 25.3.0
- `h5py` 3.16.0
- `huey` 2.6.0
- `importlib_metadata` 8.7.1
- `intel-openmp` 2025.3.3
- `isodate` 0.7.2
- `mkl-include` 2025.3.1
- `mkl-static` 2025.3.1
- `mlflow` 3.11.1
- `mlflow-skinny` 3.11.1
- `mlflow-tracing` 3.11.1
- `msal` 1.36.0
- `msal-extensions` 1.3.1
- `narwhals` 2.19.0
- `onemkl-license` 2025.3.1
- `onnx` 1.19.0
- `onnx-ir` 0.2.0
- `onnxscript` 0.6.2
- `onnxslim` 0.1.91
- `opentelemetry-api` 1.41.0
- `opentelemetry-exporter-otlp` 1.41.0
- `opentelemetry-exporter-otlp-proto-common` 1.41.0
- `opentelemetry-exporter-otlp-proto-grpc` 1.41.0
- `opentelemetry-exporter-otlp-proto-http` 1.41.0
- `opentelemetry-proto` 1.41.0
- `opentelemetry-sdk` 1.41.0
- `opentelemetry-semantic-conventions` 0.62b0
- `opentelemetry-semantic-conventions-ai` 0.5.1
- `plotly` 6.7.0
- `prettytable` 3.17.0
- `pyproject_hooks` 1.2.0
- `runai-model-streamer-azure` 0.15.7
- `scikit-learn` 1.8.0
- `sentence-transformers` 5.4.1
- `skops` 0.13.0
- `sqlparse` 0.5.5
- `tbb` 2022.3.1
- `tbb-devel` 2022.3.1
- `triton-rocm` 3.6.0
- `ultralytics-opencv-headless` 8.4.37
- `vcs-versioning` 1.1.1
- `zipp` 3.23.1
- `zstandard` 0.25.0

**Removed:**

- `cuda-pathfinder` 1.4.3
- `cupy-cuda12x` 14.0.1
- `grpcio-tools` 1.78.0
- `opencv-python` 4.13.0.92
- `patchelf` 0.17.2.4
- `pytorch-triton-rocm` 3.5.1
- `ray` 2.54.0
- `ultralytics` 8.4.23

