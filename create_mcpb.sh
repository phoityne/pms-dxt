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

mcpb pack . download/pty-mcp-server-${version}.mcpb

cp -p download/pty-mcp-server-${version}.mcpb download/pty-mcp-server-${version}.mcpb.zip

ls -la download

exit 0
