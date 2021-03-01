#!/bin/bash
# ========================================================================================
# ========================================================================================
#
#      Run/Install file for ldc-server:httpd-ewsdocker${ldcvers}${ldcextv}
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version httpd-ewsdocker-0.1.0-b4
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
echo "Stopping and removing httpd-ewsdocker${ldcvers}${ldcextv}"
echo

docker stop httpd-ewsdocker${ldcvers}${ldcextv}
docker rm httpd-ewsdocker${ldcvers}${ldcextv}

echo
echo "Installing and starting httpd-ewsdocker${ldcvers}${ldcextv} from ewsdocker/ldc-server:httpd${ldcvers}${ldcextv}"
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
   -v ${HOME}/.config/docker/ldc-server-httpd-ewsdocker${ldcvers}:/root \
   -v ${HOME}/.config/docker/ldc-server-httpd-ewsdocker${ldcvers}/workspace:/workspace \
   \
   -v ${HOME}/Development/ewsdocker:/usr/local/apache2/htdocs/ \
   \
   -p 9000:80/tcp \
   -p 9001:443/tcp \
   \
   --network="${webnet}" \
   \
   --name ewsdocker-httpd \
 ewsdocker/ldc-server:httpd${ldcvers}${ldcextv}
[[ $? -eq 0 ]] ||
 {
 	echo "Unable to install/run httpd-ewsdocker${ldcvers}${ldcextv} from ewsdocker/ldc-server:httpd${ldcvers}${ldcextv}"
 	exit 2
 }
 
echo
echo "Successfully installed httpd-ewsdocker${ldcvers}${ldcextv} from ewsdocker/ldc-server:httpd${ldcvers}${ldcextv}"
echo

exit 0
