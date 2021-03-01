#!/usr/bin/env bash
set -eou pipefail

 while IFS=',' read -ra MIGRATION_DIRECTORIES; do
      for directory in "${MIGRATION_DIRECTORIES[@]}"; do
          pushd $directory
          if [[ $SQLITE = true ]] ; then
              sudo chown -R $(whoami) $2
          fi
          diesel migration run --database-url $2
          popd
      done
 done <<< "$1"
