# Release notes for lumi-multitorch-u24r72f21m50t211-20260929_104918

**Release links:**
- [Release README](https://github.com/lumi-ai-factory/laifs-container-recipes-release-artifacts/blob/main/lumi-multitorch-u24r72f21m50t211-20260929_104918/lumi-multitorch-u24r72f21m50t211-20260929_104918.md)
- [GitHub release](https://github.com/lumi-ai-factory/laifs-container-recipes/releases/tag/lumi-multitorch-u24r72f21m50t211-20260929_104918)
- [Recipe changes](https://github.com/lumi-ai-factory/laifs-container-recipes/compare/lumi-multitorch-u24r70f21m50t210-20260807_115122...lumi-multitorch-u24r72f21m50t211-20260929_104918)
- [Known issues](https://github.com/lumi-ai-factory/laifs-container-recipes/issues?q=label%3Alumi-multitorch-u24r72f21m50t211-20260929_104918)

## Major updates

### ROCm 7.2.4

- Upgraded **ROCm from 7.0.2 to [7.2.4](https://rocm.docs.amd.com/en/docs-7.2.4/about/release-notes.html)**, with all ROCm components and packages updated accordingly.

### PyTorch 2.11.0
- Upgraded **PyTorch from 2.10.0 to [2.11.0](https://pytorch.org/blog/pytorch-2-11-release-blog/)** with many downstream impacts, including updated versions of **[vLLM v0.26.0](https://github.com/vllm-project/vllm/releases#release-v0.26.0)** and **[Transformer Engine v2.15 ROCm](https://github.com/ROCm/TransformerEngine/releases/tag/v2.15_rocm)**.

## Other changes

-   By default, HPE Slingshot uses the `memhooks` monitor unless set otherwise with the appropriate Libfabric environment variable. Also, HPE guides to select `userfaultfd` for applications that use NCCL or RCCL collectives libraries as they can hang at scale under `memhooks`.

    To overcome many of the known limitations as well as avoiding the need to configure this per-application, HPE introduced **[kdreg2](https://support.hpe.com/hpesc/public/docDisplay?docId=dp00006606en_us&page=install/kdreg2_introduction.html&docLocale=en_US)** as a third memory cache monitor. Therefore, the default memory monitor is set to `kdreg2` but it can be changed by using the environment variable `FI_MR_CACHE_MONITOR`:

    ```bash
    export FI_MR_CACHE_MONITOR=<mode>
    ```
- Ubuntu base image is now **[ubuntu:noble-20260911](https://hub.docker.com/layers/library/ubuntu/noble-20260911/)**

## Package changes

Comprehensive list of package changes comparing the following releases:

- `lumi-multitorch-full-u24r70f21m50t210-20260807_115122.json`
- `lumi-multitorch-full-u24r72f21m50t211-20260929_104918.json`

### Apt package changes

**Changed:**

- `amd-smi-lib` 26.0.2.70002-56~24.04 -> 26.2.2.70204-93~24.04
- `aws-ofi-nccl` 1.20.0-git-a2a6d08 -> 1.21.1
- `base-files` 13ubuntu10.4 -> 13ubuntu10.5
- `bsdextrautils` 2.39.3-9ubuntu6.5 -> 2.39.3-9ubuntu6.6
- `bsdutils` 1:2.39.3-9ubuntu6.5 -> 1:2.39.3-9ubuntu6.6
- `bzip2` 1.0.8-5.1build0.1 -> 1.0.8-5.1ubuntu0.1
- `comgr` 3.0.0.70002-56~24.04 -> 3.0.0.70204-93~24.04
- `composablekernel-dev` 1.1.0.70002-56~24.04 -> 1.2.0.70204-93~24.04
- `coreutils` 9.4-3ubuntu6.2 -> 9.4-3ubuntu6.3
- `curl` 8.5.0-2ubuntu10.11 -> 8.5.0-2ubuntu10.15
- `diffutils` 1:3.10-1build1 -> 1:3.10-1ubuntu0.1
- `dirmngr` 2.4.4-2ubuntu17.4 -> 2.4.4-2ubuntu17.6
- `gnupg` 2.4.4-2ubuntu17.4 -> 2.4.4-2ubuntu17.6
- `gnupg-utils` 2.4.4-2ubuntu17.4 -> 2.4.4-2ubuntu17.6
- `gpg` 2.4.4-2ubuntu17.4 -> 2.4.4-2ubuntu17.6
- `gpg-agent` 2.4.4-2ubuntu17.4 -> 2.4.4-2ubuntu17.6
- `gpgconf` 2.4.4-2ubuntu17.4 -> 2.4.4-2ubuntu17.6
- `gpgsm` 2.4.4-2ubuntu17.4 -> 2.4.4-2ubuntu17.6
- `gpgv` 2.4.4-2ubuntu17.4 -> 2.4.4-2ubuntu17.6
- `half` 1.12.0.70002-56~24.04 -> 1.12.0.70204-93~24.04
- `hip-dev` 7.0.51831.70002-56~24.04 -> 7.2.53211.70204-93~24.04
- `hip-doc` 7.0.51831.70002-56~24.04 -> 7.2.53211.70204-93~24.04
- `hip-runtime-amd` 7.0.51831.70002-56~24.04 -> 7.2.53211.70204-93~24.04
- `hip-samples` 7.0.51831.70002-56~24.04 -> 7.2.53211.70204-93~24.04
- `hipblas` 3.0.2.70002-56~24.04 -> 3.2.0.70204-93~24.04
- `hipblas-common-dev` 1.2.0.70002-56~24.04 -> 1.4.0.70204-93~24.04
- `hipblas-dev` 3.0.2.70002-56~24.04 -> 3.2.0.70204-93~24.04
- `hipblaslt` 1.0.0.70002-56~24.04 -> 1.2.2.70204-93~24.04
- `hipblaslt-dev` 1.0.0.70002-56~24.04 -> 1.2.2.70204-93~24.04
- `hipcc` 1.1.1.70002-56~24.04 -> 1.1.1.70204-93~24.04
- `hipcub-dev` 4.0.0.70002-56~24.04 -> 4.2.0.70204-93~24.04
- `hipfft` 1.0.20.70002-56~24.04 -> 1.0.22.70204-93~24.04
- `hipfft-dev` 1.0.20.70002-56~24.04 -> 1.0.22.70204-93~24.04
- `hipify-clang` 20.0.0.70002-56~24.04 -> 22.0.0.70204-93~24.04
- `hiprand` 3.0.0.70002-56~24.04 -> 3.1.0.70204-93~24.04
- `hiprand-dev` 3.0.0.70002-56~24.04 -> 3.1.0.70204-93~24.04
- `hipsolver` 3.0.0.70002-56~24.04 -> 3.2.0.70204-93~24.04
- `hipsolver-dev` 3.0.0.70002-56~24.04 -> 3.2.0.70204-93~24.04
- `hipsparse` 4.0.1.70002-56~24.04 -> 4.2.0.70204-93~24.04
- `hipsparse-dev` 4.0.1.70002-56~24.04 -> 4.2.0.70204-93~24.04
- `hipsparselt` 0.2.4.70002-56~24.04 -> 0.2.6.70204-93~24.04
- `hipsparselt-dev` 0.2.4.70002-56~24.04 -> 0.2.6.70204-93~24.04
- `hiptensor` 2.0.0.70002-56~24.04 -> 2.2.0.70204-93~24.04
- `hiptensor-dev` 2.0.0.70002-56~24.04 -> 2.2.0.70204-93~24.04
- `hsa-amd-aqlprofile` 1.0.0.70002-56~24.04 -> 1.0.0.70204-93~24.04
- `hsa-rocr` 1.18.0.70002-56~24.04 -> 1.18.0.70204-93~24.04
- `hsa-rocr-dev` 1.18.0.70002-56~24.04 -> 1.18.0.70204-93~24.04
- `keyboxd` 2.4.4-2ubuntu17.4 -> 2.4.4-2ubuntu17.6
- `libaom3` 3.8.2-2ubuntu0.1 -> 3.8.2-2ubuntu0.2
- `libapparmor1` 4.0.1really4.0.1-0ubuntu0.24.04.7 -> 4.0.1really4.0.1-0ubuntu0.24.04.8
- `libattr1` 1:2.5.2-1build1.1 -> 1:2.5.2-1ubuntu0.1
- `libaudit-common` 1:3.1.2-2.1build1.1 -> 1:3.1.2-2.1ubuntu0.1
- `libaudit1` 1:3.1.2-2.1build1.1 -> 1:3.1.2-2.1ubuntu0.1
- `libblkid1` 2.39.3-9ubuntu6.5 -> 2.39.3-9ubuntu6.6
- `libbz2-1.0` 1.0.8-5.1build0.1 -> 1.0.8-5.1ubuntu0.1
- `libc-bin` 2.39-0ubuntu8.8 -> 2.39-0ubuntu8.9
- `libc-dev-bin` 2.39-0ubuntu8.8 -> 2.39-0ubuntu8.9
- `libc6` 2.39-0ubuntu8.8 -> 2.39-0ubuntu8.9
- `libc6-dbg` 2.39-0ubuntu8.8 -> 2.39-0ubuntu8.9
- `libc6-dev` 2.39-0ubuntu8.8 -> 2.39-0ubuntu8.9
- `libcurl3t64-gnutls` 8.5.0-2ubuntu10.11 -> 8.5.0-2ubuntu10.15
- `libcurl4-openssl-dev` 8.5.0-2ubuntu10.11 -> 8.5.0-2ubuntu10.15
- `libcurl4t64` 8.5.0-2ubuntu10.11 -> 8.5.0-2ubuntu10.15
- `libevent-core-2.1-7t64` 2.1.12-stable-9ubuntu2 -> 2.1.12-stable-9ubuntu2.2
- `libexpat1` 2.6.1-2ubuntu0.4 -> 2.6.1-2ubuntu0.6
- `libexpat1-dev` 2.6.1-2ubuntu0.4 -> 2.6.1-2ubuntu0.6
- `libgcrypt20` 1.10.3-2ubuntu0.1 -> 1.10.3-2ubuntu0.2
- `libglib2.0-0t64` 2.80.0-6ubuntu3.8 -> 2.80.0-6ubuntu3.9
- `libgssapi-krb5-2` 1.20.1-6ubuntu2.7 -> 1.20.1-6ubuntu2.10
- `libk5crypto3` 1.20.1-6ubuntu2.7 -> 1.20.1-6ubuntu2.10
- `libkrb5-3` 1.20.1-6ubuntu2.7 -> 1.20.1-6ubuntu2.10
- `libkrb5support0` 1.20.1-6ubuntu2.7 -> 1.20.1-6ubuntu2.10
- `libmount1` 2.39.3-9ubuntu6.5 -> 2.39.3-9ubuntu6.6
- `libncurses-dev` 6.4+20240113-1ubuntu2.1 -> 6.4+20240113-1ubuntu2.2
- `libncurses6` 6.4+20240113-1ubuntu2.1 -> 6.4+20240113-1ubuntu2.2
- `libncursesw6` 6.4+20240113-1ubuntu2.1 -> 6.4+20240113-1ubuntu2.2
- `libp11-kit0` 0.25.3-4ubuntu2.1 -> 0.25.3-4ubuntu2.2
- `libpam-modules` 1.5.3-5ubuntu5.6 -> 1.5.3-5ubuntu5.7
- `libpam-modules-bin` 1.5.3-5ubuntu5.6 -> 1.5.3-5ubuntu5.7
- `libpam-runtime` 1.5.3-5ubuntu5.6 -> 1.5.3-5ubuntu5.7
- `libpam0g` 1.5.3-5ubuntu5.6 -> 1.5.3-5ubuntu5.7
- `libpciaccess-dev` 0.17-3ubuntu0.24.04.2 -> 0.17-3ubuntu0.24.04.3
- `libpciaccess0` 0.17-3ubuntu0.24.04.2 -> 0.17-3ubuntu0.24.04.3
- `libperl5.38t64` 5.38.2-3.2ubuntu0.3 -> 5.38.2-3.2ubuntu0.6
- `libproc2-0` 2:4.0.4-4ubuntu3.2 -> 2:4.0.4-4ubuntu3.3
- `libpython3.12-dev` 3.12.3-1ubuntu0.15 -> 3.12.3-1ubuntu0.17
- `libpython3.12-minimal` 3.12.3-1ubuntu0.15 -> 3.12.3-1ubuntu0.17
- `libpython3.12-stdlib` 3.12.3-1ubuntu0.15 -> 3.12.3-1ubuntu0.17
- `libpython3.12t64` 3.12.3-1ubuntu0.15 -> 3.12.3-1ubuntu0.17
- `librabbitmq4` 0.11.0-1ubuntu0.1 -> 0.11.0-1ubuntu0.2
- `libsmartcols1` 2.39.3-9ubuntu6.5 -> 2.39.3-9ubuntu6.6
- `libsqlite3-0` 3.45.1-1ubuntu2.7 -> 3.45.1-1ubuntu2.8
- `libsqlite3-dev` 3.45.1-1ubuntu2.7 -> 3.45.1-1ubuntu2.8
- `libssh-4` 0.10.6-2ubuntu0.4 -> 0.10.6-2ubuntu0.5
- `libssh-gcrypt-4` 0.10.6-2ubuntu0.4 -> 0.10.6-2ubuntu0.5
- `libssl3t64` 3.0.13-0ubuntu3.12 -> 3.0.13-0ubuntu3.15
- `libsystemd0` 255.4-1ubuntu8.16 -> 255.4-1ubuntu8.17
- `libtinfo6` 6.4+20240113-1ubuntu2.1 -> 6.4+20240113-1ubuntu2.2
- `libudev1` 255.4-1ubuntu8.16 -> 255.4-1ubuntu8.17
- `libuuid1` 2.39.3-9ubuntu6.5 -> 2.39.3-9ubuntu6.6
- `libxml2` 2.9.14+dfsg-1.3ubuntu3.8 -> 2.9.14+dfsg-1.3ubuntu3.9
- `libxml2-dev` 2.9.14+dfsg-1.3ubuntu3.8 -> 2.9.14+dfsg-1.3ubuntu3.9
- `linux-libc-dev` 6.8.0-137.137 -> 6.8.0-142.142
- `locales` 2.39-0ubuntu8.8 -> 2.39-0ubuntu8.9
- `miopen-hip` 3.5.0.70002-56~24.04 -> 3.5.1.70204-93~24.04
- `miopen-hip-dev` 3.5.0.70002-56~24.04 -> 3.5.1.70204-93~24.04
- `mount` 2.39.3-9ubuntu6.5 -> 2.39.3-9ubuntu6.6
- `ncurses-base` 6.4+20240113-1ubuntu2.1 -> 6.4+20240113-1ubuntu2.2
- `ncurses-bin` 6.4+20240113-1ubuntu2.1 -> 6.4+20240113-1ubuntu2.2
- `openmp-extras-dev` 20.70.0.70002-56~24.04 -> 20.70.0.70204-93~24.04
- `openmp-extras-runtime` 20.70.0.70002-56~24.04 -> 20.70.0.70204-93~24.04
- `openssl` 3.0.13-0ubuntu3.12 -> 3.0.13-0ubuntu3.15
- `perl` 5.38.2-3.2ubuntu0.3 -> 5.38.2-3.2ubuntu0.6
- `perl-base` 5.38.2-3.2ubuntu0.3 -> 5.38.2-3.2ubuntu0.6
- `perl-modules-5.38` 5.38.2-3.2ubuntu0.3 -> 5.38.2-3.2ubuntu0.6
- `procps` 2:4.0.4-4ubuntu3.2 -> 2:4.0.4-4ubuntu3.3
- `python3.12` 3.12.3-1ubuntu0.15 -> 3.12.3-1ubuntu0.17
- `python3.12-dev` 3.12.3-1ubuntu0.15 -> 3.12.3-1ubuntu0.17
- `python3.12-minimal` 3.12.3-1ubuntu0.15 -> 3.12.3-1ubuntu0.17
- `python3.12-venv` 3.12.3-1ubuntu0.15 -> 3.12.3-1ubuntu0.17
- `rccl` 2.26.6.70002-56~24.04 -> 2.27.7.70204-93~24.04
- `rccl-dev` 2.26.6.70002-56~24.04 -> 2.27.7.70204-93~24.04
- `rccl-tests` 2.18.3-81a5a30 -> 2.27.7.70204-93~24.04-485afdf
- `rocalution` 4.0.0.70002-56~24.04 -> 4.1.0.70204-93~24.04
- `rocalution-dev` 4.0.0.70002-56~24.04 -> 4.1.0.70204-93~24.04
- `rocblas` 5.0.2.70002-56~24.04 -> 5.2.0.70204-93~24.04
- `rocblas-dev` 5.0.2.70002-56~24.04 -> 5.2.0.70204-93~24.04
- `rocfft` 1.0.34.70002-56~24.04 -> 1.0.36.70204-93~24.04
- `rocfft-dev` 1.0.34.70002-56~24.04 -> 1.0.36.70204-93~24.04
- `rocm-cmake` 0.14.0.70002-56~24.04 -> 0.14.0.70204-93~24.04
- `rocm-core` 7.0.2.70002-56~24.04 -> 7.2.4.70204-93~24.04
- `rocm-dbgapi` 0.77.4.70002-56~24.04 -> 0.77.4.70204-93~24.04
- `rocm-debug-agent` 2.1.0.70002-56~24.04 -> 2.1.0.70204-93~24.04
- `rocm-dev` 7.0.2.70002-56~24.04 -> 7.2.4.70204-93~24.04
- `rocm-device-libs` 1.0.0.70002-56~24.04 -> 1.0.0.70204-93~24.04
- `rocm-gdb` 16.3.70002-56~24.04 -> 16.3.70204-93~24.04
- `rocm-libs` 7.0.2.70002-56~24.04 -> 7.2.4.70204-93~24.04
- `rocm-llvm` 20.0.0.25385.70002-56~24.04 -> 22.0.0.26084.70204-93~24.04
- `rocm-opencl` 2.0.0.70002-56~24.04 -> 2.0.0.70204-93~24.04
- `rocm-opencl-dev` 2.0.0.70002-56~24.04 -> 2.0.0.70204-93~24.04
- `rocm-smi-lib` 7.8.0.70002-56~24.04 -> 7.8.0.70204-93~24.04
- `rocm-utils` 7.0.2.70002-56~24.04 -> 7.2.4.70204-93~24.04
- `rocminfo` 1.0.0.70002-56~24.04 -> 1.0.0.70204-93~24.04
- `rocprim-dev` 4.0.1.70002-56~24.04 -> 4.2.0.70204-93~24.04
- `rocprofiler` 2.0.70002.70002-56~24.04 -> 2.0.70204.70204-93~24.04
- `rocprofiler-dev` 2.0.70002.70002-56~24.04 -> 2.0.70204.70204-93~24.04
- `rocprofiler-plugins` 2.0.70002.70002-56~24.04 -> 2.0.70204.70204-93~24.04
- `rocprofiler-register` 0.6.0.70002-56~24.04 -> 0.6.0.70204-93~24.04
- `rocprofiler-sdk` 1.0.0-56~24.04 -> 1.1.0-93~24.04
- `rocprofiler-sdk-rocpd` 1.0.0-56~24.04 -> 1.1.0-93~24.04
- `rocprofiler-sdk-roctx` 1.0.0-56~24.04 -> 1.1.0-93~24.04
- `rocrand` 4.0.0.70002-56~24.04 -> 4.2.0.70204-93~24.04
- `rocrand-dev` 4.0.0.70002-56~24.04 -> 4.2.0.70204-93~24.04
- `rocsolver` 3.30.1.70002-56~24.04 -> 3.32.0.70204-93~24.04
- `rocsolver-dev` 3.30.1.70002-56~24.04 -> 3.32.0.70204-93~24.04
- `rocsparse` 4.0.3.70002-56~24.04 -> 4.2.0.70204-93~24.04
- `rocsparse-dev` 4.0.3.70002-56~24.04 -> 4.2.0.70204-93~24.04
- `rocthrust-dev` 4.0.0.70002-56~24.04 -> 4.2.0.70204-93~24.04
- `roctracer` 4.1.70002.70002-56~24.04 -> 4.1.70204.70204-93~24.04
- `roctracer-dev` 4.1.70002.70002-56~24.04 -> 4.1.70204.70204-93~24.04
- `rocwmma-dev` 2.0.0.70002-56~24.04 -> 2.2.0.70204-93~24.04
- `sqlite3` 3.45.1-1ubuntu2.7 -> 3.45.1-1ubuntu2.8
- `sudo` 1.9.15p5-3ubuntu5.24.04.2 -> 1.9.15p5-3ubuntu5.24.04.3
- `util-linux` 2.39.3-9ubuntu6.5 -> 2.39.3-9ubuntu6.6
- `wget` 1.21.4-1ubuntu4.4 -> 1.21.4-1ubuntu4.5
- `zlib1g` 1:1.3.dfsg-3.1ubuntu2.1 -> 1:1.3.dfsg-3.1ubuntu2.2
- `zlib1g-dev` 1:1.3.dfsg-3.1ubuntu2.1 -> 1:1.3.dfsg-3.1ubuntu2.2

**Added:**

- `libdw1t64` 0.190-1.1ubuntu0.1
- `shs-kdreg2-dev` 0.4-SHS12.0.2-746483b

**Removed:**

- `amdgpu-dkms` 1:6.12.12.60404-2202139.24.04
- `amdgpu-dkms-firmware` 1:6.12.12.60404-2202139.24.04
- `busybox-initramfs` 1:1.36.1-6ubuntu3.1
- `cpio` 2.15+dfsg-1ubuntu2
- `dhcpcd-base` 1:10.0.6-1ubuntu3.2
- `dkms` 3.0.11-1ubuntu13
- `dracut-install` 060+5-1ubuntu3.3
- `initramfs-tools` 0.142ubuntu25.8
- `initramfs-tools-bin` 0.142ubuntu25.8
- `initramfs-tools-core` 0.142ubuntu25.8
- `klibc-utils` 2.0.13-4ubuntu0.2
- `libargon2-1` 0~20190702+dfsg-4build1
- `libcryptsetup12` 2:2.7.0-1ubuntu4.2
- `libdevmapper1.02.1` 2:1.02.185-3ubuntu3.2
- `libfdisk1` 2.39.3-9ubuntu6.5
- `libklibc` 2.0.13-4ubuntu0.2
- `libpng-tools` 1.6.43-5ubuntu0.6
- `libsystemd-shared` 255.4-1ubuntu8.16
- `linux-base` 4.5ubuntu9+24.04.2
- `lsb-release` 12.0-2
- `systemd` 255.4-1ubuntu8.16
- `systemd-dev` 255.4-1ubuntu8.16
- `udev` 255.4-1ubuntu8.16

### Pip package changes

**Changed:**

- `GitPython` 3.1.58 -> 3.1.62
- `Mako` 1.4.1 -> 1.4.3
- `Markdown` 3.10.3 -> 3.11
- `PyJWT` 2.13.0 -> 2.15.1
- `Pygments` 2.20.0 -> 2.21.0
- `SQLAlchemy` 2.0.51 -> 2.1.1
- `Werkzeug` 3.1.8 -> 3.1.9
- `alembic` 1.19.0 -> 1.20.0
- `amdsmi` 26.0.2+39589fda -> 26.2.2+97f5574fe2
- `anthropic` 0.121.0 -> 1.9.0
- `anyio` 4.14.2 -> 4.15.1
- `apache-tvm-ffi` 0.1.13.post2 -> 0.1.10
- `apex` 1.10.0+lumi.aif.gfx90a.e97c665 -> 1.11.0+lumi.aif.gfx90a.c0f56f7
- `argon2-cffi-bindings` 25.1.0 -> 26.1.0
- `azure-storage-blob` 12.30.0 -> 12.30.3
- `bitsandbytes` 0.50.0 -> 0.50.2
- `blake3` 1.0.9 -> 1.0.10
- `boto3` 1.43.67 -> 1.43.105
- `botocore` 1.43.67 -> 1.43.105
- `build` 1.5.0 -> 1.6.1
- `cachetools` 7.1.7 -> 7.2.0
- `charset-normalizer` 3.4.9 -> 3.5.1
- `click` 8.4.2 -> 8.5.0
- `contourpy` 1.3.3 -> 1.4.0
- `cryptography` 49.0.0 -> 50.0.1
- `databricks-sdk` 0.125.0 -> 0.143.0
- `debugpy` 1.8.21 -> 1.8.22
- `deepspeed` 0.19.2+lumi.aif.dsops -> 0.19.6+lumi.aif.dsops
- `detect-installer` 0.1.0 -> 0.2.1
- `fastapi` 0.141.1 -> 0.136.3
- `fastapi-cloud-cli` 0.23.0 -> 0.26.0
- `fastar` 0.11.0 -> 0.12.0
- `fastjsonschema` 2.22.1 -> 2.22.2
- `filelock` 3.32.2 -> 4.0.6
- `fonttools` 4.63.0 -> 4.66.0
- `fqdn` 1.5.1 -> 1.6.0
- `google-api-core` 2.34.0 -> 2.40.0
- `google-auth` 2.56.3 -> 2.59.0
- `google-cloud-core` 2.6.1 -> 2.8.0
- `google-cloud-storage` 3.13.1 -> 3.15.1
- `google-crc32c` 1.8.0 -> 1.9.0
- `google-resumable-media` 2.10.1 -> 2.11.0
- `googleapis-common-protos` 1.75.1 -> 1.75.4
- `graphql-core` 3.2.11 -> 3.2.13
- `gunicorn` 26.0.0 -> 26.2.0
- `hiredis` 3.4.1 -> 3.4.2
- `httpcore2` 2.9.1 -> 2.13.1
- `httpx2` 2.9.1 -> 2.13.1
- `huey` 3.3.4 -> 3.4.0
- `huggingface_hub` 1.27.0 -> 1.33.0
- `idna` 3.18 -> 3.20
- `importlib_metadata` 9.0.0 -> 9.0.1
- `intel-cmplr-lib-ur` 2026.1.1 -> 2026.1.2
- `intel-openmp` 2026.1.1 -> 2026.1.2
- `ipython` 9.16.1 -> 9.17.1
- `ipywidgets` 8.1.8 -> 8.1.9
- `jedi` 0.19.2 -> 0.20.0
- `jiter` 0.16.0 -> 0.17.0
- `joblib` 1.5.3 -> 1.6.0
- `jupyter_builder` 1.2.2 -> 1.2.3
- `jupyter_client` 8.9.1 -> 8.10.0
- `jupyter_server` 2.20.0 -> 2.21.1
- `jupyterlab` 4.6.2 -> 4.6.4
- `jupyterlab_server` 2.28.0 -> 2.28.1
- `jupyterlab_widgets` 3.0.16 -> 3.0.17
- `kiwisolver` 1.5.0 -> 1.5.1
- `lightning` 2.6.5 -> 2.6.6
- `loro` 1.13.2 -> 1.16.2
- `marimo` 0.23.16 -> 0.25.0
- `matplotlib` 3.11.1 -> 3.11.2
- `mcp` 2.0.0 -> 2.2.0
- `mcp-types` 2.0.0 -> 2.2.0
- `megatron-core` 0.15.0rc8+lumi.aif.c333868 -> 0.18.0+lumi.aif.9784f40
- `mistral_common` 1.11.7 -> 1.12.0
- `ml_dtypes` 0.5.4 -> 0.6.0
- `mlflow` 3.15.1 -> 3.16.1
- `mlflow-skinny` 3.15.1 -> 3.16.1
- `mlflow-tracing` 3.15.1 -> 3.16.1
- `msal` 1.37.0 -> 1.39.0
- `msgpack` 1.2.1 -> 1.2.3
- `multidict` 6.7.1 -> 6.9.1
- `narwhals` 2.24.0 -> 2.26.0
- `nbformat` 5.11.0 -> 5.11.1
- `nest-asyncio2` 1.7.2 -> 1.7.3
- `networkx` 3.6.1 -> 3.7
- `ninja` 1.13.0 -> 1.13.2
- `nltk` 3.10.2 -> 3.10.3
- `notebook` 7.6.1 -> 7.6.3
- `numcodecs` 0.16.5 -> 0.17.0
- `onnx-ir` 0.2.1 -> 1.0.0
- `onnxscript` 0.7.1 -> 0.7.2
- `onnxslim` 0.1.95 -> 0.1.97
- `openai` 2.53.0 -> 3.22.0
- `opentelemetry-api` 1.44.0 -> 1.45.0
- `opentelemetry-exporter-otlp` 1.44.0 -> 1.45.0
- `opentelemetry-exporter-otlp-proto-common` 1.44.0 -> 1.45.0
- `opentelemetry-exporter-otlp-proto-grpc` 1.44.0 -> 1.45.0
- `opentelemetry-exporter-otlp-proto-http` 1.44.0 -> 1.45.0
- `opentelemetry-proto` 1.44.0 -> 1.45.0
- `opentelemetry-sdk` 1.44.0 -> 1.45.0
- `opentelemetry-semantic-conventions` 0.65b0 -> 0.66b0
- `pandas` 2.3.3 -> 3.0.6
- `peft` 0.20.0 -> 0.21.1
- `platformdirs` 4.11.0 -> 4.12.1
- `plotly` 6.9.0 -> 7.1.0
- `polars` 1.43.2 -> 1.44.2
- `polars-runtime-32` 1.43.2 -> 1.44.2
- `propcache` 0.5.2 -> 0.5.4
- `proto-plus` 1.28.3 -> 1.29.0
- `pure_eval` 0.2.3 -> 0.2.4
- `pyarrow` 25.0.0 -> 25.0.1
- `pybase64` 1.4.3 -> 1.5.0
- `pydantic` 2.13.4 -> 2.13.5
- `pydantic_core` 2.46.4 -> 2.46.5
- `pymdown-extensions` 11.0.1 -> 11.0.2
- `pyparsing` 3.3.2 -> 3.3.3
- `pyproject_hooks` 1.2.0 -> 1.3.3
- `python-dotenv` 1.2.2 -> 1.2.3
- `python-json-logger` 4.1.0 -> 4.2.0
- `pytorch-lightning` 2.6.5 -> 2.6.6
- `pytz` 2026.3.post1 -> 2026.4
- `pyzmq` 27.1.0 -> 27.2.0
- `regex` 2026.7.19 -> 2026.9.29
- `rich-toolkit` 0.20.3 -> 0.20.5
- `scikit-learn` 1.9.0 -> 1.9.1
- `scipy` 1.18.0 -> 1.18.1
- `sentence-transformers` 5.7.0 -> 6.1.0
- `sentry-sdk` 2.66.1 -> 2.71.0
- `setuptools-scm` 10.2.1 -> 10.3.4
- `skops` 0.14.0 -> 0.16.0
- `soupsieve` 2.9.2 -> 2.10
- `sqlparse` 0.5.5 -> 0.6.0
- `sse-starlette` 3.4.8 -> 3.5.0
- `starlette` 1.4.1 -> 1.7.0
- `threadpoolctl` 3.6.0 -> 3.7.0
- `tiktoken` 0.13.0 -> 0.14.0
- `timm` 1.0.28 -> 1.0.30
- `torch` 2.10.0+rocm7.0.lumi.aif.20260807140531 -> 2.11.0+rocm7.2.lumi.aif.20260929120822
- `torchaudio` 2.10.0+rocm7.0 -> 2.11.0+rocm7.2
- `torchvision` 0.25.0+rocm7.0 -> 0.26.0+rocm7.2
- `tornado` 6.5.8 -> 6.5.10
- `trl` 1.9.2 -> 1.14.1
- `typer` 0.27.1 -> 0.27.2
- `typing-inspection` 0.4.2 -> 0.4.4
- `tzdata` 2026.3 -> 2026.4
- `ultralytics-opencv-headless` 8.4.116 -> 8.4.165
- `ultralytics-thop` 2.1.6 -> 2.2.1
- `urllib3` 2.7.0 -> 2.8.0
- `uvicorn` 0.52.1 -> 0.54.0
- `vcs-versioning` 2.2.3 -> 2.5.0
- `vllm` 0.22.1+lumi.aif.gfx90a.0decac0 -> 0.26.0+lumi.aif.gfx90a.568afb3
- `wandb` 0.28.1 -> 0.30.0
- `watchfiles` 1.2.0 -> 1.3.0
- `wcwidth` 0.8.2 -> 0.9.1
- `webencodings` 0.5.1 -> 0.6.1
- `websocket-client` 1.9.0 -> 1.9.2
- `websockets` 17.0.1 -> 17.1
- `wheel` 0.47.0 -> 0.48.0
- `widgetsnbextension` 4.0.15 -> 4.0.16
- `wrapt` 2.3.0 -> 2.5.0
- `xgrammar` 0.2.3 -> 0.2.7
- `xxhash` 3.8.1 -> 4.0.1
- `yarl` 1.24.5 -> 1.25.1
- `zarr` 3.3.0 -> 3.4.0

**Added:**

- `agent-detector` 2.0.0
- `cmake` 4.4.3
- `fastsafetensors` 0.4.0
- `opentelemetry-exporter-http-transport` 0.66b0
- `opentelemetry-exporter-otlp-common` 0.66b0
- `ultralytics-platform` 0.1.70

**Removed:**

- `diskcache` 5.6.3
- `distro` 1.9.0
- `gguf` 0.19.0
- `greenlet` 3.5.4
- `impi-devel` 2021.18.1
- `impi-rt` 2021.18.1
- `intel-cmplr-lib-rt` 2026.1.1
- `intel-cmplr-lic-rt` 2026.1.1
- `intel-sycl-rt` 2026.1.1
- `oneccl` 2022.1.1
- `oneccl-devel` 2022.1.1

