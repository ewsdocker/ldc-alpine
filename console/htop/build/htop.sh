#!/bin/bash
# ========================================================================================
# ========================================================================================
#
#    build/hot.sh
#      Build/Installation file for ldc-console:htop-0.1.0-b4
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version ldc-console:htop-0.1.0-b4
# @copyright © 2018-2021. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ldc-alpine
# @subpackage ldc-console
#
# ========================================================================================
#
#	Copyright © 2018-2021. EarthWalk Software
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

cd ~/Development/ewsldc/ldc-alpine/console/htop

echo
echo "Stopping and removing ahtop${ldcvers}${ldcextv}"
echo

docker stop ahtop${ldcvers}${ldcextv}
docker rm ahtop${ldcvers}${ldcextv}

echo
echo "Removing ldc-console:htop${ldcvers}${ldcextv}"
echo

docker rmi ewsdocker/ldc-console:htop${ldcvers}${ldcextv}

echo
echo "Building ewsdocker/ldc-console:htop${ldcvers}${ldcextv}"
echo

docker build \
  --build-arg DNAME="AHTOP" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="console" \
  \
  --build-arg BUILD_NAME="ldc-console" \
  --build-arg BUILD_VERSION="htop" \
  --build-arg BUILD_VERS_EXT="${ldcvers}" \
  --build-arg BUILD_EXT_MOD="${ldcextv}" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-foundation" \
  --build-arg FROM_VERS="base" \
  --build-arg FROM_EXT="-${ldcvers}" \
  --build-arg FROM_EXT_MOD="${ldcextv}" \
  \
  --file=Dockerfile \
  -t ewsdocker/ldc-console:htop${ldcvers}${ldcextv} .
[[ $? -eq 0 ]] ||
 {
 	echo "ewsdocker/ldc-console:htop${ldcvers}${ldcextv} failed"
 	exit 1
 }

echo
echo "Completed build of ldc-console:htop${ldcvers}${ldcextv} from ldc-foundation:base${ldcvers}${ldcextv}"
echo

. run/htop.sh
