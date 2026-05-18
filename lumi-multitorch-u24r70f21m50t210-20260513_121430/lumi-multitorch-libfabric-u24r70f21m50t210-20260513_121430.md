# Container Image lumi-multitorch-libfabric-u24r70f21m50t210-20260513_121430

Id: ec3d50f443a1858b6438bd6dd8b1c4186dac2a7d5540b4f88480ea8a61e4125e
Created: 2026-05-13T12:30:00.896242943Z

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

dd9cd16fe24ad15d28d3fbd53b8d6f5067f7e06f2d5e367bf026ee520aba3ca0  lumi-multitorch-libfabric-u24r70f21m50t210-20260513_121430.Containerfile
c7b5dc0dd6029962124692234bceb1488f75d6ba0cedb72840db8bf00157c547  lumi-multitorch-libfabric-u24r70f21m50t210-20260513_121430.json
4ae31527626e794ced1b77d61254db80ee3a5c34bd1e54cea04808e538eecda4  lumi-multitorch-libfabric-u24r70f21m50t210-20260513_121430.log
f5ce03b5825f4f46e56819128e47e88d0e100a94bebfc211eaeffcdcfa99060a  lumi-multitorch-libfabric-u24r70f21m50t210-20260513_121430.sif
