#!/usr/bin/env bash
set -eou pipefail

 while IFS=',' read -ra MIGRATION_DIRECTORIES; do
      for directory in "${MIGRATION_DIRECTORIES[@]}"; do
          pushd $directory
          sudo chown -R $(whoami) $directory
          diesel migration run --database-url $2
          popd
      done
 done <<< "$1"
