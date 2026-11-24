# Release notes for lumi-multitorch-emsign-ca-2026-10

**Release links:**
- [GitHub release](https://github.com/lumi-ai-factory/laifs-container-recipes/releases/tag/lumi-multitorch-emsign-ca-2026-10)
- [Notice for users](https://github.com/lumi-ai-factory/laifs-container-recipes/blob/lumi-multitorch-emsign-ca-2026-10/hotfixes/emsign-ca-2026-10/README.md)
- [Known issues](https://github.com/lumi-ai-factory/laifs-container-recipes/issues?q=label%3Alumi-multitorch-emsign-ca-2026-10)

This hotfix makes **patched releases** of the earlier lumi-multitorch
variants, whose images no longer trust the root certificate
`emSign ECC Root CA - G3`. See the [notice for users](https://github.com/lumi-ai-factory/laifs-container-recipes/blob/lumi-multitorch-emsign-ca-2026-10/hotfixes/emsign-ca-2026-10/README.md)
for what to do.

Each patched release is the latest release of its variant with only these
packages upgraded to
[versions that no longer trust the root](https://emudhra.we-have-a-problem.com/#patched-bundles):

- `ca-certificates`, Ubuntu's system CA store, in all images,
- `pip` and `certifi` in the torch, full and plus images,
- `botocore` in the full and plus images, as
  [AWS security bulletin 2026-150-AWS](https://aws.amazon.com/security/security-bulletins/2026-150-aws/)
  advises, with the packages it needs.

The exact versions are in the package changes of the full image, which has
all of these packages. The package changes of each image are in the
release's archive, in `-changes.json` files.

## Fixed releases

The release to use for each variant, the release that a patched release is
built on, and the affected releases that it replaces:

| Variant | Fixed release | Built on | Replaces |
|---|---|---|---|
| u24r72f21m50t211 | `u24r72f21m50t211-20261028_090706`, official release | - | 20260929_104918 |
| u24r70f21m50t210 | [`u24r70f21m50t210-20261123_101228`](#u24r70f21m50t210), patched release | 20260807_115122 | 20260415_130625, 20260513_121430, 20260731_122833, 20260807_115122 |
| u24r64f21m43t29 | [`u24r64f21m43t29-20261123_101228`](#u24r64f21m43t29), patched release | 20260319_153422 | 20251209_134408, 20260124_092648, 20260216_093549, 20260225_144743, 20260319_153422 |
| u24r64f21m43t28 | None, end of life | - | 20251128_145346 |
| `laifs-lumi-multi-20250728_103251.sif` | None, end of life | - | - |

## Patched releases

### u24r70f21m50t210

Release `u24r70f21m50t210-20261123_101228` patches [`u24r70f21m50t210-20260807_115122`](https://github.com/lumi-ai-factory/laifs-container-recipes/releases/tag/lumi-multitorch-u24r70f21m50t210-20260807_115122).

| SIF file | SHA-256 |
|---|---|
| `lumi-multitorch-rocm-u24r70f21m50t210-20261123_101228.sif` | `670ff90c9955791688e81b57db8bce50077a68d72cf3dd4cd315428afe649d7d` |
| `lumi-multitorch-libfabric-u24r70f21m50t210-20261123_101228.sif` | `e1243689206047307d6b203935168b72be735b6b8f54d19c65d2724520e8c90d` |
| `lumi-multitorch-mpich-u24r70f21m50t210-20261123_101228.sif` | `163b7ac8abd54f6cb3c4ebeed13e78ad306578c2a62ddce60e3edd8daf0164fc` |
| `lumi-multitorch-torch-u24r70f21m50t210-20261123_101228.sif` | `605325a07eb295ce54b4a72d559f7320032ab3d5bba888894e855ad0f07fcca6` |
| `lumi-multitorch-full-u24r70f21m50t210-20261123_101228.sif` | `721fbf555c8839fd4211e9098c1a5fc17817bfa336ce4f664e97cf2d3773ea79` |
| `lumi-multitorch-plus-u24r70f21m50t210-20261123_101228.sif` | `e5d05461991cb7a7d65e58b146c874be675099b62b61e51f1488a4f696551c5b` |

<details>
<summary>Package changes of the full image</summary>

Comprehensive list of package changes comparing the following releases:

- `lumi-multitorch-full-u24r70f21m50t210-20260807_115122.json`
- `lumi-multitorch-full-u24r70f21m50t210-20261123_101228.json`

#### Apt package changes

**Changed:**

- `ca-certificates` 20260601~24.04.1 -> 20260816ubuntu0.24.04.2

#### Pip package changes

**Changed:**

- `boto3` 1.43.67 -> 1.44.9
- `botocore` 1.43.67 -> 1.44.9
- `certifi` 2026.7.22 -> 2026.11.20
- `pip` 24.0 -> 26.2.2

</details>

### u24r64f21m43t29

Release `u24r64f21m43t29-20261123_101228` patches [`u24r64f21m43t29-20260319_153422`](https://github.com/lumi-ai-factory/laifs-container-recipes/releases/tag/lumi-multitorch-u24r64f21m43t29-20260319_153422).

| SIF file | SHA-256 |
|---|---|
| `lumi-multitorch-rocm-u24r64f21m43t29-20261123_101228.sif` | `3caca860a72233f13cc9ca0b3dc1e070f50f6a70d41bbd3f7db3702c3916f6c2` |
| `lumi-multitorch-libfabric-u24r64f21m43t29-20261123_101228.sif` | `1e29f933aa7461f58ca9c4e05b7b1d69650ca99630a629e0ed8ed45969d9b4e2` |
| `lumi-multitorch-mpich-u24r64f21m43t29-20261123_101228.sif` | `8c0278d27df72a4cf91d441c0a6547cf212fb19c00d69a20ff19c53aa765eed4` |
| `lumi-multitorch-torch-u24r64f21m43t29-20261123_101228.sif` | `a38f206bf7a303e6a40b70014acdc4f0d888750c3d6e8fd8b587e51d3175bbe5` |
| `lumi-multitorch-full-u24r64f21m43t29-20261123_101228.sif` | `326a887ae321c47d008142a5e02b11728d22d10899c8cd1b86f3b0a14ddbe5fc` |

<details>
<summary>Package changes of the full image</summary>

Comprehensive list of package changes comparing the following releases:

- `lumi-multitorch-full-u24r64f21m43t29-20260319_153422.json`
- `lumi-multitorch-full-u24r64f21m43t29-20261123_101228.json`

#### Apt package changes

**Changed:**

- `ca-certificates` 20240203 -> 20260816ubuntu0.24.04.2

#### Pip package changes

**Changed:**

- `boto3` 1.42.72 -> 1.44.9
- `botocore` 1.42.72 -> 1.44.9
- `certifi` 2026.2.25 -> 2026.11.20
- `pip` 24.0 -> 26.2.2
- `s3transfer` 0.16.0 -> 0.19.3

</details>
