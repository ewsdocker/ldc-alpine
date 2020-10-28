#!/bin/bash
# ========================================================================================
# ========================================================================================
#
#    build/anginx-pkgcache.sh
#      Build/Installation file for ldc-server:nginx-pkgcache-0.1.0-b4
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version ldc-server:nginx-pkgcache-0.1.0-b4
# @copyright © 2020. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ldc-alpine
# @subpackage ldc-server
#
# ========================================================================================
#
#	Copyright © 2020. EarthWalk Software
#	Licensed under the GNU General Public License, GPL-3.0-or-later.
#
#   This file is part of ewsdocker/ldc-alpine.
#
#   ewsdocker/ldc-alpine is free software: you can redistribute 
#   it and/or modify it under the terms of the GNU General Public License 
#   as published by the Free Software Foundation, either version 3 of the 
#   License, or (at your option) any later version.
#
#   ewsdocker/ldc-alpine is distributed in the hope that it will 
#   be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
#   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with ewsdocker/ldc-alpine.  If not, see 
#   <http://www.gnu.org/licenses/>.
#
# ========================================================================================
# ========================================================================================
cd ~/Development/ewsldc/ldc-alpine/server/nginx-pkgcache

echo
echo "Stopping and removing anginx-pkgcache-0.1.0-b4"
echo

docker stop anginx-pkgcache-0.1.0-b4
docker rm anginx-pkgcache-0.1.0-b4

echo
echo "Removing ldc-server:nginx-pkgcache-0.1.0-b4"
echo

docker rmi ewsdocker/ldc-server:nginx-pkgcache-0.1.0-b4

echo
echo "Building ewsdocker/ldc-server:nginx-pkgcache-0.1.0-b4"
echo

docker build \
  --build-arg DNAME="ANGINX-PKGCACHE" \
  \
  --build-arg BUILD_DAEMON="1" \
  --build-arg BUILD_TEMPLATE="daemon" \
  \
  --build-arg BUILD_NAME="ldc-server" \
  --build-arg BUILD_VERSION="nginx-pkgcache" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b4" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-server" \
  --build-arg FROM_VERS="nginx" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b4" \
  \
  --network=pkgnet \
  \
  --file=Dockerfile \
  -t ewsdocker/ldc-server:nginx-pkgcache-0.1.0-b4 .
[[ $? -eq 0 ]] ||
 {
 	echo "ewsdocker/ldc-server:nginx-pkgcache-0.1.0-b4 failed"
 	exit 1
 }

echo
echo "Completed build of ldc-server:nginx-pkgcache-0.1.0-b4 from ldc-server:nginx-0.1.0-b4"
echo

. run/nginx-pkgcache.sh
