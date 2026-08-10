# Container Image lumi-multitorch-libfabric-u24r70f21m50t210-20260807_115122

Id: 0acce71aa94ca3a7fcfcf0521af21d35ef39c231a6dd967e621168ce5ce11f1e
Created: 2026-08-07T12:09:38.136197753Z

## Description

**Overview**
This image builds on top of its base image by adding locally built Ubuntu
packages to enable xpmem as well as libfabric functionality for HPE's Slingshot
interconnect. It serves as a starting point for adding MPI capability to images
built on top of it and can be a useful foundation for creating images with
custom MPI stacks.

**Details**
Base image: lumi-multitorch-rocm-u24r70f21m50t210
Components:
  - xpmem (from https://github.com/hpc/xpmem commit 3bcab55)
  - Cassini headers (from https://github.com/HewlettPackard/shs-cassini-headers release tgz for 12.0.1)
  - CXI headers (from https://github.com/HewlettPackard/shs-cxi-driver commit 27f7be5)
  - libcxi (from https://github.com/HewlettPackard/shs-libcxi commit 30fa2dd)
  - Libfabric 2.1 (from https://github.com/ofiwg/libfabric commit 78d6e03)

## Files

c966f81ab502106b8d8f78ce721485e60e61a2c185a51e3dac45f7577ab5fe71  lumi-multitorch-libfabric-u24r70f21m50t210-20260807_115122.Containerfile
3cd9546d7964e90ead704762b21112a413c0742318dbd9ac9396f2b46f4b1368  lumi-multitorch-libfabric-u24r70f21m50t210-20260807_115122.json
714c14afe015829699f673dac08de6988656b60cd9df4de4e66b0c07486f6626  lumi-multitorch-libfabric-u24r70f21m50t210-20260807_115122.log
dbac09fe0ae630337b223832caf951b9e2599dffc4400e664c7942c425dc854a  lumi-multitorch-libfabric-u24r70f21m50t210-20260807_115122.sif
