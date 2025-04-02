#!/usr/bin/env bash
# set -euo pipefail  # Uncomment for stricter error handling

################
### REMINDER ###
################
# Your Dockerfile or devcontainer logic must copy and set this file as /usr/local/bin/coder-entrypoint.sh.
# For example:
# cp entrypoint.sh /usr/local/bin/coder-entrypoint.sh
# chmod +x /usr/local/bin/coder-entrypoint.sh

if [ "${FIREWALL_ENABLED}" = "true" ]; then
    echo "[entrypoint.sh] Enabling firewall..."
    sudo /usr/local/bin/init-firewall.sh
fi

exec "$@"
