#!/bin/bash -e
set -o pipefail

REPO=${repo:=open-component-model/ocm}
WORKSPACE=${GITHUB_WORKSPACE:=/usr/local}

if [ -z "$version" -o "$version" == latest ]; then
  version="$(basename "$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/$REPO/releases/latest)")"
  echo "Selecting latest version: $version"
fi
  
BINARY=ocm
VERSION=${version#v}
PLATFORM=linux
ARCH=amd64
ARCHIVEFILE="${BINARY}-${VERSION}-${PLATFORM}-${ARCH}.tar.gz"
URL="https://github.com/$REPO/releases/download/v${VERSION}/$ARCHIVEFILE"
TARGET=${WORKSPACE}/bin/ocm

cd /tmp
echo "Installing Open Component Model CLI Tool version $version from $REPO"
rm -f ocm-cli.tgz
mkdir -p "$(dirname "$TARGET")"
curl -Ls -o ocm-cli.tgz "$URL"
tar --overwrite -xvzf ocm-cli.tgz >/dev/null
cp ocm "$TARGET"
chmod a+x "$TARGET"
echo "ocm installed into $TARGET"
if [ -n "$GITHUB_OUTPUT" ]; then
  echo "ocm-path=$TARGET" >> "$GITHUB_OUTPUT"
fi
# add installation folder to PATH to be able to use "which ocm" in subsequent steps to detect installation path
echo "$WORKSPACE" >> $GITHUB_PATH
