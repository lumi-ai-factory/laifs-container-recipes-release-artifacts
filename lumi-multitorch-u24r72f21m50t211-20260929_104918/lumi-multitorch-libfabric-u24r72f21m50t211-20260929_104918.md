# Container Image lumi-multitorch-libfabric-u24r72f21m50t211-20260929_104918

Id: 34d2505a6b9a1eb0fc57605fffd1f03fe34875107e8ae824b9770a49d3d1a9c3
Created: 2026-09-29T11:10:14.634477424Z

## Description

**Overview**
This image builds on top of its base image by adding locally built Ubuntu
packages to enable xpmem as well as libfabric functionality for HPE's Slingshot
interconnect. It serves as a starting point for adding MPI capability to images
built on top of it and can be a useful foundation for creating images with
custom MPI stacks.

**Details**
Base image: lumi-multitorch-rocm-u24r72f21m50t211
Components:
  - xpmem (from https://github.com/hpc/xpmem commit 3bcab55)
  - Cassini headers (from https://github.com/HewlettPackard/shs-cassini-headers release tgz for 12.0.1)
  - CXI headers (from https://github.com/HewlettPackard/shs-cxi-driver commit 27f7be5)
  - libcxi (from https://github.com/HewlettPackard/shs-libcxi commit 30fa2dd)
  - Libfabric 2.1 (from https://github.com/ofiwg/libfabric commit 78d6e03)

## Files

f83f2bc93942179e7a023f031884996c8d6d614326ab7216c0f0eb6acda05570  lumi-multitorch-libfabric-u24r72f21m50t211-20260929_104918.Containerfile
c9f7bf2a83c4efd4fd944aee51ea8110422f130bfc2f82247f6bc0bab37fff1f  lumi-multitorch-libfabric-u24r72f21m50t211-20260929_104918.json
ccbed80414e77a1bebaca5f8b9c95ee947641e797dd175db84fe838b727f0d09  lumi-multitorch-libfabric-u24r72f21m50t211-20260929_104918.log
c8126867d2cb00a65ba89ca22ca63c7727aed7d6715847129c3337ef8936e5d6  lumi-multitorch-libfabric-u24r72f21m50t211-20260929_104918.sif
