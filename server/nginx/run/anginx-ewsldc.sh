#!/bin/bash
# ========================================================================================
# ========================================================================================
#
#      Run/Install file for anginx-ewsldc from ldc-server:nginx-0.1.0-b4.
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version anginx-ewsldc
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
echo "Stopping and removing anginx-ewsldc"
echo

docker stop anginx-ewsldc
docker rm anginx-ewsldc

echo
echo "Installing and starting anginx-ewsldc from ewsdocker/ldc-server:nginx-0.1.0-b4"
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
   -v ${HOME}/Development/ewsldc:/usr/share/nginx/html \
   \
   -v ${HOME}/bin:/userbin \
   -v ${HOME}/.local:/usrlocal \
   -v ${HOME}/.config/docker:/conf \
   -v ${HOME}/.config/docker/anginx-ewsldc:${HOME} \
   -v ${HOME}/.config/docker/anginx-ewsldc/workspace:/workspace \
   \
   --network=webnet \
   \
   --name anginx-ewsldc \
 ewsdocker/ldc-server:nginx-0.1.0-b4
[[ $? -eq 0 ]] ||
 {
 	echo "Unable to install/run anginx-ewsldc from ewsdocker/ldc-server:nginx-0.1.0-b4"
 	exit 2
 }

echo
echo "Successfully installed anginx-ewsldc from ewsdocker/ldc-server:nginx-0.1.0-b4"
echo

exit 0
