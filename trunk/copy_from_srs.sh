#!/bin/bash

echo "Copy console"
rm -rf research/console && cp -R ~/git/srs/trunk/research/console research/

echo "Copy players"
rm -rf research/players && cp -R ~/git/srs/trunk/research/players research/

echo "Copy demos"
rm -rf 3rdparty/signaling/www && cp -R ~/git/srs/trunk/3rdparty/signaling/www 3rdparty/signaling/
