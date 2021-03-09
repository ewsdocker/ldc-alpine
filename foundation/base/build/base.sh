#!/bin/bash
# ========================================================================================
# ========================================================================================
#
#    build/base.sh
#      Build/Installation file for ldc-foundation:base-0.1.0-b4
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version ldc-foundation:base-0.1.0-b5
# @copyright © 2021. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ldc-alpine
# @subpackage ldc-foundation
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

. ~/Development/ewsldc/ldc/ldc-common.sh

cd ~/Development/ewsldc/ldc-alpine/foundation/base

# ========================================================================================

echo
echo "Stopping and removing base${ldcvers}${ldcextv}"
echo

docker stop base${ldcvers}${ldcextv}
docker rm base${ldcvers}${ldcextv}

echo
echo "Removing ldc-foundation:base${ldcvers}${ldcextv}"
echo

docker rmi ewsdocker/ldc-foundation:base${ldcvers}${ldcextv}

echo
echo "Building ewsdocker/ldc-foundation:base${ldcvers}${ldcextv}"
echo

docker build \
  --build-arg DNAME="ABASE" \
  \
  --build-arg BUILD_DAEMON="1" \
  --build-arg BUILD_TEMPLATE="daemon" \
  \
  --build-arg BUILD_NAME="ldc-foundation" \
  --build-arg BUILD_VERSION="base" \
  --build-arg BUILD_VERS_EXT="${ldcvers}" \
  --build-arg BUILD_EXT_MOD="${ldcextv}" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-foundation" \
  --build-arg FROM_VERS="core" \
  --build-arg FROM_EXT="${ldcvers}" \
  --build-arg FROM_EXT_MOD="${ldcextv}" \
  \
  --build-arg LIB_VERSION="${libver}" \
  --build-arg LIB_VERS_MOD="${ldcextv}" \
  --build-arg LIB_INSTALL="1" \
  \
  --build-arg LIB_HOST="${pkgserver}" \
  --network="${pkgnet}" \
  \
  --file=Dockerfile \
-t ewsdocker/ldc-foundation:base${ldcvers}${ldcextv} .
[[ $? -eq 0 ]] ||
 {
 	echo "ewsdocker/ldc-foundation:base${ldcvers}${ldcextv} failed"
 	exit 1
 }

echo
echo "Completed build of ldc-foundation:base${ldcvers}${ldcextv} from ldc-foundation:core${ldcvers}${ldcextv}"
echo

. run/base.sh
