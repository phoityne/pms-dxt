#!/bin/bash

# openssl genrsa -out ca.key 4096
# openssl req -x509 -new -key ca.key -sha256 -days 3650 -out cert.pem

version="0.0.5.0"

dxt pack . download/pty-mcp-server-${version}.dxt

dxt sign --self-signed download/pty-mcp-server-${version}.dxt
# dxt sign --cert cert.pem --key ca.key pty-mcp-server-${version}.dxt
dxt info download/pty-mcp-server-${version}.dxt
dxt verify download/pty-mcp-server-${version}.dxt
