#!/usr/bin/env bash
# set -euo pipefail  # Uncomment for stricter error handling

devcontainer features test -f coder \
    --base-image mcr.microsoft.com/devcontainers/python:3.11-bullseye \
    --log-level debug
