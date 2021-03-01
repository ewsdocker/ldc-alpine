#!/bin/bash
# ========================================================================================
# ========================================================================================
#
#      Run/Install file for ldc-server:ewsweb-httpd
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version ewsweb-httpd
# @copyright © 2020-2021. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package httpd
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

echo
echo "Stopping and removing ewsweb-httpd"
echo

docker stop ewsweb-httpd
docker rm ewsweb-httpd

echo
echo "Installing and starting ewsweb-httpd from ewsdocker/ldc-server:httpd${ldcvers}${ldcextv}"
echo

docker run \
   -d \
   --restart unless-stopped \
   \
   -e LMS_BASE="${HOME}/.local" \
   -e LMS_HOME="${HOME}" \
   -e LMS_CONF="${HOME}/.config" \
   \
   -v /etc/localtime:/etc/localtime:ro \
   \
   -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.local/ewsldc:/opt \
  \
   -v ${HOME}/.config/docker:/conf \
   -v ${HOME}/.config/docker/ldc-server-httpd-ewsweb${ldcvers}:/root \
   -v ${HOME}/.config/docker/ldc-server-httpd-ewsweb${ldcvers}/workspace:/workspace \
   \
   -v ${HOME}/Development/ewsldc/ldc-development/web/docs:/usr/local/apache2/htdocs/ \
   \
   -p 80:80/tcp \
   -p 443:443/tcp \
   \
   --network="${webnet}" \
   \
   --name web-httpd \
 ewsdocker/ldc-server:httpd${ldcvers}${ldcextv}
[[ $? -eq 0 ]] ||
 {
 	echo "Unable to install/run ewsweb-httpd from ewsdocker/ldc-server:httpd"
 	exit 2
 }
 
echo
echo "Successfully installed ewsweb-httpd from ewsdocker/ldc-server:httpd"
echo

exit 0
