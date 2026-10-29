# Container Image lumi-multitorch-libfabric-u24r72f21m50t211-20261028_090706

Id: f4e0eb483ce384a509cc41bdcbbdce36d1764fd80ebf092540f22c92d25f7cc0
Created: 2026-10-28T09:53:46.014303776Z

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

dba91e3b381ebfdca7696e7e77d30ddaaf45c1db0e1a9da762f5e30d60a65f72  lumi-multitorch-libfabric-u24r72f21m50t211-20261028_090706.Containerfile
624aefd7575fe8d045dd7592edcc1a3e4077b9d25012f180bdea8e21a7921fb0  lumi-multitorch-libfabric-u24r72f21m50t211-20261028_090706.json
5a9c9a5f8e99d3d984a4d21c5a601545dce231b61725ba7a65898dc4ddf85405  lumi-multitorch-libfabric-u24r72f21m50t211-20261028_090706.log
22a9cc2c4d3e1200f561b48e300f9319a2a46df550fe524682e4a42f26387616  lumi-multitorch-libfabric-u24r72f21m50t211-20261028_090706.sif
