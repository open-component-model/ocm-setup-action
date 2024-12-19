#!/bin/bash -e
set -o pipefail

REPO=${repo:=open-component-model/ocm}

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

cd /tmp
echo "Installing Open Component Model CLI Tool version $version from $REPO"
rm -f ocm-cli.tgz
curl -Ls -o ocm-cli.tgz "$URL"
tar --overwrite -xvzf ocm-cli.tgz >/dev/null
chmod a+x ocm

ocm --version
