#!/bin/bash
# ========================================================================================
# ========================================================================================
#
#      Run/Install file for acore${ldcvers}${ldcextv} from ldc-foundation:core${ldcvers}${ldcextv}.
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version core-0.1.0-b4
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

# ========================================================================================

echo
echo "Stopping and removing acore${ldcvers}${ldcextv}"
echo

docker stop acore${ldcvers}${ldcextv}
docker rm acore${ldcvers}${ldcextv}

echo
echo "Installing and starting acore${ldcvers}${ldcextv} from ewsdocker/ldc-foundation:core${ldcvers}${ldcextv}"
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
   -v ${HOME}/.config/docker/ldc-foundation-core${ldcvers}:${HOME} \
   -v ${HOME}/.config/docker/ldc-foundation-core${ldcvers}/workspace:/workspace \
   \
   --name acore${ldcvers}${ldcextv} \
 ewsdocker/ldc-foundation:core${ldcvers}${ldcextv}
[[ $? -eq 0 ]] ||
 {
 	echo "Unable to install/run acore${ldcvers}${ldcextv} from ewsdocker/ldc-foundation:core${ldcvers}${ldcextv}"
 	exit 2
 }

echo
echo "Successfully installed acore${ldcvers}${ldcextv} from ewsdocker/ldc-foundation:core${ldcvers}${ldcextv}"
echo

exit 0
