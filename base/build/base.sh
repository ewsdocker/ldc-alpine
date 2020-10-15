#!/bin/bash
# ========================================================================================
# ========================================================================================
#
#    build/base.sh
#      Build/Installation file for ldc-alpine:abase-3.12.0
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version ldc-alpine:abase-3.12.0
# @copyright © 2020. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ldc-alpine
# @subpackage build
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
cd ~/Development/ewsldc/ldc-alpine/base

echo
echo "Stopping and removing abase-3.12.0"
echo

docker stop abase-3.12.0
docker rm abase-3.12.0

echo
echo "Removing ldc-alpine:abase-3.12.0"
echo

docker rmi ewsdocker/ldc-alpine:abase-3.12.0

echo
echo "Building ewsdocker/ldc-alpine:abase-3.12.0"
echo

docker build \
  --build-arg DNAME="ABASE" \
  \
  --build-arg BUILD_DAEMON="1" \
  --build-arg BUILD_TEMPLATE="daemon" \
  \
  --build-arg BUILD_NAME="ldc-alpine" \
  --build-arg BUILD_VERSION="abase" \
  --build-arg BUILD_VERS_EXT="-3.12.0" \
  --build-arg BUILD_EXT_MOD="" \
  \
  --build-arg FROM_REPO="" \
  --build-arg FROM_PARENT="nimmis" \
  --build-arg FROM_VERS="alpine-micro" \
  --build-arg FROM_EXT="-3.12" \
  --build-arg FROM_EXT_MOD="" \
  \
  --file=Dockerfile \
  -t ewsdocker/ldc-alpine:abase-3.12.0 .
[[ $? -eq 0 ]] ||
 {
 	echo "ewsdocker/ldc-alpine:abase-3.12.0 failed"
 	exit 1
 }

echo
echo "Completed build of ldc-alpine:abase-3.12.0 from ewsdocker/nimmis:alpine-micro-3.12"
echo

. run/base.sh
