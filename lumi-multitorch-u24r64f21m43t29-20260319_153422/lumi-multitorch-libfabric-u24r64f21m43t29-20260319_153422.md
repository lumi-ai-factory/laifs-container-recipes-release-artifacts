# Container Image lumi-multitorch-libfabric-u24r64f21m43t29-20260319_153422

Id: adff949f78b80f04efe782b737e4599fe8ae0b7c3251c05ce054c209361d2062
Created: 2026-03-19T15:51:43.680630532Z

## Description

**Overview**
This image builds on top of its base image by adding locally built Ubuntu
packages to enable xpmem as well as libfabric functionality for HPE's Slingshot
interconnect. It serves as a starting point for adding MPI capability to images
built on top of it and can be a useful foundation for creating images with
custom MPI stacks.

**Details**
Base image: lumi-multitorch-rocm-u24r64f21m43t29
Components:
  - xpmem (from https://github.com/hpc/xpmem commit 3bcab55)
  - Cassini headers (from https://github.com/HewlettPackard/shs-cassini-headers release tgz for 12.0.1)
  - CXI headers (from https://github.com/HewlettPackard/shs-cxi-driver commit 27f7be5)
  - libcxi (from https://github.com/HewlettPackard/shs-libcxi commit 30fa2dd)
  - Libfabric 2.1 (from https://github.com/ofiwg/libfabric commit 78d6e03)

## Files

9dcc64dfd199ee74066e9b5ffe608ba71eb6834233caff7301e4aace452b47a2  lumi-multitorch-libfabric-u24r64f21m43t29-20260319_153422.Containerfile
cb71eccfaeb7295ecde1e4b7342cdd90a6876ccc44bd4d64d7fa7632a957ed22  lumi-multitorch-libfabric-u24r64f21m43t29-20260319_153422.def
37368c56678b587c2c6170fdebf7ef2746c7a23e6f4297ef7836690708a2855a  lumi-multitorch-libfabric-u24r64f21m43t29-20260319_153422.json
046e635bf5db736b299357e415405f5b37799de0a38aaa0e4d68e217ebdd1fb5  lumi-multitorch-libfabric-u24r64f21m43t29-20260319_153422.log
490efb8102d4ffcfe942cf85971c918d642ac91f0bcd06545cae4e0d044fc668  lumi-multitorch-libfabric-u24r64f21m43t29-20260319_153422.sif
