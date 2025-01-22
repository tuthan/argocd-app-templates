#!/usr/bin/env bash

set -e

for app_dir in ./*/; do
  echo
  echo "[$(date)][$app_dir] Start test"
  echo

  cd "$app_dir" || exit

  app_name=${PWD##*/}
  if [ -d "tests" ]; then
    for test_file in ./tests/*.yaml; do
      echo
      echo "[$(date)][$app_dir] Test case: $test_file"
      echo

      helm template --debug --values "$test_file" "$app_name" . >"$test_file.output"

      if [ "$1" == "print" ]; then
        echo
        cat "$test_file.output"
        echo
      fi
    done
  fi
  cd - > /dev/null || exit

  echo
  echo "[$(date)][$app_dir] Complete test"
  echo
done
