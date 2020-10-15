#!/bin/bash
# ========================================================================================
# ========================================================================================
#
#    build-httpd
#      Build/Installation file for httpd-2.4.46-alpine.
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version httpd-2.4.46
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

echo
echo "Stopping and removing httpd-2.4.46"
echo

docker stop httpd-2.4.46 rm httpd-2.4.46

echo
echo "Removing ldc-alpine:httpd-2.4.46"
echo

docker rmi ewsdocker/ldc-alpine:httpd-2.4.46

echo
echo "Building ldc-alpine:httpd-2.4.46"
echo

docker build \
  --build-arg DNAME="HTTPD" \
  \
  --build-arg BUILD_DAEMON="1" \
  --build-arg BUILD_TEMPLATE="daemon" \
  \
  --build-arg BUILD_NAME="ldc-alpine" \
  --build-arg BUILD_VERSION="httpd" \
  --build-arg BUILD_VERS_EXT="-2.4.46" \
  --build-arg BUILD_EXT_MOD="" \
  \
  --build-arg FROM_REPO="" \
  --build-arg FROM_PARENT="ldc-alpine" \
  --build-arg FROM_VERS="httpd" \
  --build-arg FROM_EXT="-2.4.46" \
  --build-arg FROM_EXT_MOD="" \
  \
  --file=Dockerfile \
  -t ewsdocker/ldc-alpine:httpd-2.4.46 .
[[ $? -eq 0 ]] ||
 {
 	echo "ewsdocker/ldc-alpine:httpd-2.4.46 failed"
 	exit 1
 }

echo
echo "Completed build of ldc-alpine from ewsdocker/ldc-alpine:httpd-2.4.46"
echo

. ../run/httpd.sh
