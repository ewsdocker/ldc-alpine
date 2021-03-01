#!/bin/bash
# ========================================================================================
# ========================================================================================
#
#      Run/Install file for anginx-0.1.0-b4 from ldc-server:nginx-0.1.0-b4.
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
echo "Stopping and removing anginx${ldcvers}${ldcextv}"
echo

docker stop anginx${ldcvers}${ldcextv}
docker rm anginx${ldcvers}${ldcextv}

echo
echo "Installing and starting anginx${ldcvers}${ldcextv} from ewsdocker/ldc-server:nginx${ldcvers}${ldcextv}"
echo

docker run \
   -d \
   \
   --restart unless-stopped \
   \
   -e LMS_BASE="${HOME}/.local" \
   -e LMS_HOME="${HOME}" \
   -e LMS_CONF="${HOME}/.config" \
   \
   -v /etc/localtime:/etc/localtime:ro \
   --mount source=nginx-html,target=/usr/share/nginx/html \
   -p 127.0.0.1:8000:80/tcp \
   \
   -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.local/ewsldc:/opt \
  \
   -v ${HOME}/.config/docker:/conf \
   -v ${HOME}/.config/docker/ldc-server-nginx${ldcvers}:${HOME} \
   -v ${HOME}/.config/docker/ldc-server-nginx${ldcvers}/workspace:/workspace \
   \
   --network=webnet \
   \
   --name anginx${ldcvers}${ldcextv} \
 ewsdocker/ldc-server:nginx${ldcvers}${ldcextv}
[[ $? -eq 0 ]] ||
 {
 	echo "Unable to install/run anginx${ldcvers}${ldcextv} from ewsdocker/ldc-server:nginx${ldcvers}${ldcextv}"
 	exit 2
 }

echo
echo "Successfully installed anginx${ldcvers}${ldcextv} from ewsdocker/ldc-server:nginx${ldcvers}${ldcextv}"
echo

exit 0
