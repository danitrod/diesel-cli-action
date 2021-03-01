#!/usr/bin/env bash
set -eou pipefail

 while IFS=',' read -ra MIGRATION_DIRECTORIES; do
      for directory in "${MIGRATION_DIRECTORIES[@]}"; do
          pushd $directory
          diesel migration run --database-url $2
          if [[ $SQLITE = true ]] ; then
              chown -R $(whoami) $2
          fi
          popd
      done
 done <<< "$1"
