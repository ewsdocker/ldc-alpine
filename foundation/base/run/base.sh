#!/bin/bash
# ========================================================================================
# ========================================================================================
#
#      Run/Install file for abase-0.1.0-b4 from ldc-foundation:base-0.1.0-b4.
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version ldc-foundation-base-0.1.0-b4
# @copyright © 2020-2021. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ldc-alpine
# @subpackage ldc-foundation
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

cd ~/Development/ewsldc/ldc-alpine/foundation/base

# ========================================================================================

echo
echo "Stopping and removing abase${ldcvers}${ldcextv}"
echo

docker stop abase${ldcvers}${ldcextv}
docker rm abase${ldcvers}${ldcextv}

echo
echo "Installing and starting abase${ldcvers}${ldcextv} from ewsdocker/ldc-foundation:base${ldcvers}${ldcextv}"
echo

docker run \
   -d \
   --rm \
   \
   -e LMS_BASE="${HOME}/.local" \
   \
   -v /etc/localtime:/etc/localtime:ro \
   \
   -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.local/ewsldc:/opt \
  \
   -v ${HOME}/.config/docker:/conf \
   -v ${HOME}/.config/docker/ldc-foundation-base${ldcvers}:${HOME} \
   -v ${HOME}/.config/docker/ldc-foundation-base${ldcvers}/workspace:/workspace \
   \
   --mount source=pkgcache,target=/usr/share/nginx/html \
   \
   --name abase${ldcvers}${ldcextv} \
 ewsdocker/ldc-foundation:base${ldcvers}${ldcextv}
[[ $? -eq 0 ]] ||
 {
 	echo "Unable to install/run abase${ldcvers}${ldcextv} from ewsdocker/ldc-foundation:base${ldcvers}${ldcextv}"
 	exit 2
 }

echo
echo "Successfully installed abase${ldcvers}${ldcextv} from ewsdocker/ldc-foundation:base${ldcvers}${ldcextv}"
echo

exit 0
