#!/bin/bash
set -e

TAG=$(git describe --tags --exact-match 2>/dev/null) || {
  echo "ERROR: No git tag found on current commit. Create a tag first: git tag v2.2" >&2
  exit 1
}
VERSION=${TAG#v}

cd package

export DEBEMAIL="info@citronics.eu"
export DEBFULLNAME="Citronics"
dch --newversion "$VERSION" --distribution stable "Release $VERSION"

debuild -us -uc -aarmhf

cd ..
