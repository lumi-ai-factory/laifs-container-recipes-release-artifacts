# Container Image lumi-multitorch-libfabric-u24r70f21m50t210-20260731_122833

Id: 1942fd90e16f7b79d76d5da424e6def5e2e4a2efc74165bbbddd17b30115e2e3
Created: 2026-07-31T12:47:10.771254107Z

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

85a2a8b7d9056af71f164388e832b02c8f7a949469346a01b1593abf40b2ef8d  lumi-multitorch-libfabric-u24r70f21m50t210-20260731_122833.Containerfile
26f9884e8a5860d74bfb15f46e8a682ddd6267ca55df2fe7ae9c8360865fe670  lumi-multitorch-libfabric-u24r70f21m50t210-20260731_122833.json
4f371adf63afa74cb0df89ceadb60ea83bab31c99fbbd2223d96dcfde925d4c0  lumi-multitorch-libfabric-u24r70f21m50t210-20260731_122833.log
04ae8e623267ab6325a9831e6f974876f319f1686f3f288d1a2c6ed47a4cd135  lumi-multitorch-libfabric-u24r70f21m50t210-20260731_122833.sif
