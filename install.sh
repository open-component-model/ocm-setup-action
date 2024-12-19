#!/bin/bash -e
set -o pipefail

REPO=${repo:=open-component-model/ocm}

if [ -z "$version" -o "$version" == latest ]; then
  version="$(basename "$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/$REPO/releases/latest)")"
  echo "Selecting latest version: $version"
fi
  
VERSION=${version#v}
PLATFORM=linux
ARCH=amd64
ARCHIVEFILE="ocm-${VERSION}-${PLATFORM}-${ARCH}.tar.gz"
URL="https://github.com/$REPO/releases/download/v${VERSION}/$ARCHIVEFILE"
TARGET="$HOME/.local/bin"

# prepare target directory
mkdir -p $TARGET
cd $TARGET
rm -f ocm-cli.tgz
echo "$$TARGET" >> "$GITHUB_PATH"

echo "Installing ocm-cli version $version from $REPO"
curl -LsS -o ocm-cli.tgz "$URL"
tar --overwrite -xvzf ocm-cli.tgz >/dev/null
chmod a+x ocm
