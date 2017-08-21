# Script for Building Base Images based on ARM64
## Introduction
Here we provide a set of scripts for building docker baseimages of CentOS, Ubuntu and Debian based on ARM64.<br>
## Usage
**mkimage.sh** is the interface for calling build scripts. Use it to start building. For example:
```Bash
./mkimage.sh -t username/centos estuary_centos_base 3.0
```
Try **./mkimage.sh -h** for more information.<br>
## Scripts
Scripts in **/mkimage/** are for building base images.<br>
**mkimage/debootstrap** is for buildg Ubuntu or Debian base image.<br>
**mkimage/extuary\_centos\_base** is for building CentOS base image.<br>
**mkimage/estuary_..._build** are for building images of those operating systems inculding more tools.<br>
**mkimage/busybos-static** is for building an image for researching which contains only busybox tools.<br>
