#!/bin/bash
set -e

TAG=$(git describe --tags --exact-match)
VERSION=${TAG#v}

echo "Building unudhcpd $VERSION..."
./build.sh

DEB=$(find . -maxdepth 1 -name "unudhcpd_${VERSION}_armhf.deb" | head -1)
if [ -z "$DEB" ]; then
  echo "ERROR: Expected unudhcpd_${VERSION}_armhf.deb not found"
  exit 1
fi

echo "Creating GitHub release $TAG..."
gh release create "$TAG" "$DEB" \
  --repo Citronics/unudhcpd-deb \
  --title "unudhcpd $VERSION" \
  --notes "Release $VERSION"

echo "Done. Release $TAG published with $DEB"
