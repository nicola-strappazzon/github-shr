#!/usr/bin/env bash
set -euo pipefail

./config.sh \
    --unattended \
    --url https://github.com/${REPOSITORY} \
    --token ${TOKEN} \
    --name ${NAME}

./run.sh
