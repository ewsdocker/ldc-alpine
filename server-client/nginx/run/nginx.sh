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
#
#	docker network create -d bridge --subnet=172.33.0.0/16 nginx-net
#
# ========================================================================================
# ========================================================================================

echo
echo "Stopping and removing anginx-client-0.1.0-b4"
echo

docker stop anginx-client-0.1.0-b4
docker rm anginx-client-0.1.0-b4

echo
echo "Installing and starting anginx-client-0.1.0-b4 from ewsdocker/ldc-server-client:nginx-0.1.0-b4"
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
   -v ${HOME}/.config/docker:/conf \
   -v ${HOME}/.config/docker/ldc-server-client-nginx-0.1.0:${HOME} \
   -v ${HOME}/.config/docker/ldc-server-client-nginx-0.1.0/workspace:/workspace \
   \
   --network=nginx-net \
   \
   --name anginx-client-0.1.0-b4 \
 ewsdocker/ldc-server-client:nginx-0.1.0-b4
[[ $? -eq 0 ]] ||
 {
 	echo "Unable to install/run anginx-client-0.1.0-b4 from ewsdocker/ldc-server-client:nginx-0.1.0-b4"
 	exit 2
 }

echo
echo "Successfully installed anginx-client-0.1.0-b4 from ewsdocker/ldc-server-client:nginx-0.1.0-b4"
echo

exit 0
