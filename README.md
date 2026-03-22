# unudhcpd Debian Package

Debian package for [unudhcpd](https://gitlab.com/postmarketOS/unudhcpd), based on postmarketOS' source tree.

## Prerequisites

```
sudo apt-get install devscripts meson
```

For cross-compilation from x86/amd64:

```
sudo apt-get install crossbuild-essential-armhf
```

## Building

Initialize the submodule, tag the commit, and run the build script:

```
git submodule update --init
git tag v2.3
./build.sh
```

This produces `unudhcpd_<version>_armhf.deb` in the repository root.

## Releasing

To build and publish a release to GitHub in one step:

```
git tag v2.3
git push origin v2.3
./release.sh
```

`release.sh` calls `build.sh`, then uploads the `.deb` to a GitHub Release. After releasing, trigger the [deb-packages](https://github.com/Citronics/deb-packages) workflow to update the APT repository.
