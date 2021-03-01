#!/bin/bash
# ========================================================================================
# ========================================================================================
#
#    build-httpd
#      Build/Installation file for httpd-0.1.0-b4-alpine.
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version httpd-0.1.0-b4
# @copyright © 2020-2021. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ldc-alpine
# @subpackage build
#
# ========================================================================================
#
#	Copyright © 2020-2021. EarthWalk Software
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

. ~/Development/ewsldc/ldc/ldc-common.sh

cd ~/Development/ewsldc/ldc-alpine/server/httpd

echo
echo "Stopping and removing httpd${ldcvers}${ldcextv}"
echo

docker stop httpd${ldcvers}${ldcextv} 
docker rm httpd${ldcvers}${ldcextv}

echo
echo "Removing ldc-server:httpd${ldcvers}${ldcextv}"
echo

docker rmi ewsdocker/ldc-server:httpd${ldcvers}${ldcextv}

echo
echo "Building ldc-server:httpd${ldcvers}${ldcextv}"
echo

docker build \
  --build-arg DNAME="HTTPD" \
  \
  --build-arg BUILD_DAEMON="1" \
  --build-arg BUILD_TEMPLATE="daemon" \
  \
  --build-arg BUILD_NAME="ldc-server" \
  --build-arg BUILD_VERSION="httpd" \
  --build-arg BUILD_VERS_EXT="${ldcvers}" \
  --build-arg BUILD_EXT_MOD="${ldcextv}" \
  \
  --build-arg FROM_REPO="" \
  --build-arg FROM_PARENT="httpd" \
  --build-arg FROM_VERS="2.4.46" \
  --build-arg FROM_EXT="-alpine" \
  --build-arg FROM_EXT_MOD="" \
  \
  --file=Dockerfile \
  -t ewsdocker/ldc-server:httpd${ldcvers}${ldcextv} .
[[ $? -eq 0 ]] ||
 {
 	echo "ewsdocker/ldc-server:httpd${ldcvers}${ldcextv} failed"
 	exit 1
 }

echo
echo "Completed build of ldc-server:httpd${ldcvers}${ldcextv} from httpd:2.4.46-alpine"
echo

. run/httpd.sh
