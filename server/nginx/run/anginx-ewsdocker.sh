#!/bin/bash
# ========================================================================================
# ========================================================================================
#
#      Run/Install file for anginx-ewsdocker from ldc-server:nginx-0.1.0-b4.
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version anginx-ewsdocker
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
echo "Stopping and removing anginx-ewsdocker"
echo

docker stop anginx-ewsdocker
docker rm anginx-ewsdocker

echo
echo "Installing and starting anginx-ewsdocker from ewsdocker/ldc-server:nginx-0.1.0-b4"
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
   \
   -v ${HOME}/Development/ewsdocker:/usr/share/nginx/html \
   -p 80:80 \
   \
   -v ${HOME}/bin:/userbin \
   -v ${HOME}/.local:/usrlocal \
   -v ${HOME}/.config/docker:/conf \
   -v ${HOME}/.config/docker/anginx-ewsdocker:${HOME} \
   -v ${HOME}/.config/docker/anginx-ewsdocker/workspace:/workspace \
   \
   --network=webnet \
   \
   --name anginx-ewsdocker \
 ewsdocker/ldc-server:nginx-0.1.0-b4
[[ $? -eq 0 ]] ||
 {
 	echo "Unable to install/run anginx-ewsdocker from ewsdocker/ldc-server:nginx-0.1.0-b4"
 	exit 2
 }

echo
echo "Successfully installed anginx-ewsdocker from ewsdocker/ldc-server:nginx-0.1.0-b4"
echo

exit 0
