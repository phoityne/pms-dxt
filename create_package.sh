#!/bin/bash

# openssl genrsa -out ca.key 4096
# openssl req -x509 -new -key ca.key -sha256 -days 3650 -out cert.pem

version=$1

ls -la bin

echo "Decompressing .xz binaries in bin/..."
for file in bin/*.xz; do
  [ -e "$file" ] || continue
  echo "Decompressing $file"
  xz -d -k "$file"
done

mv bin/pty-mcp-server-macos-aarch64 bin/pty-mcp-server
mv bin/pty-mcp-server-windows-no-mingw.exe bin/pty-mcp-server.exe

dxt pack . download/pty-mcp-server-${version}.dxt

cp -p download/pty-mcp-server-${version}.dxt download/pty-mcp-server-${version}.zip

dxt sign --self-signed download/pty-mcp-server-${version}.dxt
# dxt sign --cert cert.pem --key ca.key pty-mcp-server-${version}.dxt
dxt info download/pty-mcp-server-${version}.dxt
dxt verify download/pty-mcp-server-${version}.dxt

ls -la download

exit 0
