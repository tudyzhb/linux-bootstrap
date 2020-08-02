#!/bin/bash

# cuda
dnf config-manager --add-repo=https://negativo17.org/repos/fedora-nvidia.repo
dnf install make kernel-devel dkms-nvidia  nvidia-driver-cuda cuda-devel cuda-cudnn-devel

# https://www.jianshu.com/p/3cedce05a481 DKMS全称是Dynamic Kernel Module Support，它可以帮我们维护内核外的这些驱动程序，在内核版本变动之后可以自动重新生成新的模块。
nvcc -V
dkms status
dkms install -m nvidia -v 450.57
nvidia-smi
lsmod  | grep nv
