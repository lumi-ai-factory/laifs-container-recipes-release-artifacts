# Container Image lumi-multitorch-libfabric-u24r70f21m50t210-20260415_130625

Id: 5bc723f17dfb76adf1ed27e978e57a5c6ec956ba725f0a87ef6f2a10397d6c93
Created: 2026-04-15T13:33:10.716274693Z

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

f0ca33c0f279cc1528308c1a138e8d66b78572d6f01850003033213d52ffcd2f  lumi-multitorch-libfabric-u24r70f21m50t210-20260415_130625.Containerfile
43a55fc44495fe2cbb47c0d561030a1b1f8130d49609f00068c7519b8277d42a  lumi-multitorch-libfabric-u24r70f21m50t210-20260415_130625.def
0ed46107f967946e6a9c2217f928a1d2582037a84c9404460d340a7565672873  lumi-multitorch-libfabric-u24r70f21m50t210-20260415_130625.json
f01b91c671473066d0f4233216f4776decb063c905ef5ce5a43290745b74bb7a  lumi-multitorch-libfabric-u24r70f21m50t210-20260415_130625.log
82f9b091e31dc4381d6bb9fee959e4d539641b0240153e92337864cab889a82a  lumi-multitorch-libfabric-u24r70f21m50t210-20260415_130625.sif
