#!/usr/bin/env bash
set -eou pipefail

 while IFS=',' read -ra MIGRATION_DIRECTORIES; do
      for directory in "${MIGRATION_DIRECTORIES[@]}"; do
          pushd $directory
          diesel migration run --database-url $DATABASE_URL
          popd
      done
 done <<< "$1"
