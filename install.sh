#!/bin/sh -e

WORKSPACE="/usr/local"
REPO=${repo:=open-component-model/ocm}
VERSION=${version:=v0.2.0-rc.1}
PLATFORM=Linux_x86_64
ARCHIVESUFFIX=.tar.gz
ARCHIVEFILE="ocm_$PLATFORM$ARCHIVESUFFIX"
URL="https://github.com/$REPO/releases/download/$VERSION/$ARCHIVEFILE"
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