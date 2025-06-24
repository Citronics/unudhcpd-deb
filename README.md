# UNUDHCPD debian package

Debian package for unudhcpd, based on PostmarketOS' source tree.

## Prerequisites

Install `devscripts` and `meson`. You can do so by running `apt install devscripts meson` on Ubuntu or Debian.

You will also need a cross compilation toolchain if you are not running this script on armhf.

`apt install crossbuild-essential-armhf`

## Building package

```
cd package
./build.sh
```
