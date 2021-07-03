#!/bin/bash

if [[ ! -d trunk || ! -d wiki ]]; then
  echo "no trunk or wiki at $(pwd)"
  exit -1
fi

if [[ ! -d ~/git/srs.wiki || ! -d ~/git/srs/trunk ]]; then
  echo "no srs or wiki at ~/git"
  exit -1
fi

if [[ ! -d ~/git/webrtc-web ]]; then
  echo "no webrtc-web at ~/git"
  exit -1
fi

echo "Copy wiki"
cp -R ~/git/srs.wiki/images wiki/

echo "Copy webrtc-web"
cp -R ~/git/webrtc-web/* webrtc-web/

echo "Copy console"
rm -rf trunk/research/console && cp -R ~/git/srs/trunk/research/console trunk/research/

echo "Copy players"
rm -rf trunk/research/players && cp -R ~/git/srs/trunk/research/players trunk/research/

echo "Copy demos"
rm -rf trunk/3rdparty/signaling/www && cp -R ~/git/srs/trunk/3rdparty/signaling/www trunk/3rdparty/signaling/

