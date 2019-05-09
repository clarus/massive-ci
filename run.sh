#!/bin/sh

for testFolder in */ ; do
  echo ========== $testFolder ==========
  echo Lauching Docker...
  if docker build $testFolder $@; then
    echo The test $testFolder is successful
  else
    echo The test $testFolder failed
    exit 1
  fi
  echo
done
