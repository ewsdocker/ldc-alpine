#!/bin/bash
# ========================================================================================
# ========================================================================================
#
#      Run/Install file for anginx-0.1.0-b4 from ldc-server-client:nginx-client-0.1.0-b4.
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version anginx-0.1.0-b4
# @copyright © 2020-2021. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ldc-alpine
# @subpackage ldc-server
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
#
#	docker network create -d bridge --subnet=172.33.0.0/16 nginx-net
#
# ========================================================================================
# ========================================================================================

. ~/Development/ewsldc/ldc/ldc-common.sh

echo
echo "Stopping and removing anginx-client${ldcvers}${ldcextv}"
echo

docker stop anginx-client${ldcvers}${ldcextv}
docker rm anginx-client${ldcvers}${ldcextv}

echo
echo "Installing and starting anginx-client${ldcvers}${ldcextv} from ewsdocker/ldc-server-client:nginx${ldcvers}${ldcextv}"
echo

docker run \
   \
   -it \
   \
   -e RUN_APP="/bin/bash" \
   \
   -e LMS_BASE="${HOME}/.local" \
   -e LMS_HOME="${HOME}" \
   -e LMS_CONF="${HOME}/.config" \
   \
   -v /etc/localtime:/etc/localtime:ro \
   --mount source=nginx-html,target=/public_html \
   \
   -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.local/ewsldc:/opt \
  \
   -v ${HOME}/.config/docker:/conf \
   -v ${HOME}/.config/docker/ldc-server-client-nginx${ldcvers}:${HOME} \
   -v ${HOME}/.config/docker/ldc-server-client-nginx${ldcvers}/workspace:/workspace \
   \
   --network="${nginxnet}" \
   \
   --name anginx-client${ldcvers}${ldcextv} \
 ewsdocker/ldc-server-client:nginx${ldcvers}${ldcextv}
[[ $? -eq 0 ]] ||
 {
 	echo "Unable to install/run anginx-client${ldcvers}${ldcextv} from ewsdocker/ldc-server-client:nginx${ldcvers}${ldcextv}"
 	exit 2
 }

echo
echo "Successfully installed anginx-client${ldcvers}${ldcextv} from ewsdocker/ldc-server-client:nginx${ldcvers}${ldcextv}"
echo

exit 0
