#!/bin/sh -e

WORKSPACE="${GITHUB_WORKSPACE:=/usr/local}"
WORKSPACE="/usr/local"
VERSION=${version:=v0.1.0-alpha.1}
REPO=${repo:=open-component-model/ocm}
URL=https://github.com/$REPO/releases/download
PLATFORM=linux-amd64
if [ "$REPO" != "gardener/component-cli" ]; then
  ARCHIVESUFFIX=.tgz
  ARCHIVEFILE="ocm-$PLATFORM$ARCHIVESUFFIX"
else
  ARCHIVESUFFIX=.gz
  ARCHIVEFILE="componentcli-$PLATFORM$ARCHIVESUFFIX"
fi
FILE="$(basename "$ARCHIVEFILE" $ARCHIVESUFFIX)"
TARGET=${WORKSPACE}/bin/ocm

cd /tmp
echo "Install Open Component Model Tool version $version from $REPO"
rm -f "$ARCHIVEFILE"
wget -q "$URL/$VERSION/$ARCHIVEFILE"
mkdir -p "$(dirname "$TARGET")"
if [ "$ARCHIVESUFFIX" = .tgz ]; then
  tar -xzf "$ARCHIVEFILE"
else
  gunzip -f "$ARCHIVEFILE"
fi
cp "$FILE" "$TARGET"
chmod a+x "$TARGET"
echo "installed into $TARGET"
echo "::set-output name=ocm-path::$TARGET"
