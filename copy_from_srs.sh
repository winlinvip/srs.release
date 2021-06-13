#!/bin/bash

if [[ ! -d trunk ]]; then
  echo "no trunk"
  exit -1
fi

echo "Copy wiki"
cp -R ~/git/srs.wiki/images wiki/

echo "Copy players and demos"
bash trunk/copy_from_srs.sh

