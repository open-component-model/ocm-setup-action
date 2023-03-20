#!/bin/sh -e

WORKSPACE="/usr/local"
REPO=${repo:=open-component-model/ocm}
BINARY=ocm
VERSION=${version:=v0.3.0-rc.1}
PLATFORM=linux
ARCH=amd64
ARCHIVEFILE="${BINARY}-${VERSION#v}-${PLATFORM}-${ARCH}.tar.gz"
URL="https://github.com/$REPO/releases/download/v${VERSION#v}/$ARCHIVEFILE"
TARGET=${WORKSPACE}/bin/ocm

cd /tmp
echo "Install Open Component Model CLI Tool version $version from $REPO"
rm -f ocm-cli.tgz
mkdir -p "$(dirname "$TARGET")"
curl -L -o ocm-cli.tgz "$URL"
tar --overwrite -xvzf ocm-cli.tgz
cp ocm "$TARGET"
chmod a+x "$TARGET"
echo "ocm installed into $TARGET"
echo "ocm-path=$TARGET" >> $GITHUB_OUTPUT
