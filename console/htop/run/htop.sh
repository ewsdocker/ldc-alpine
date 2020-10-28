#!/bin/bash
# ========================================================================================
# ========================================================================================
#
#    run apkgcache-client.sh
#      Run/Installation file for ldc-console:htop-0.1.0-b4
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version ldc-console:htop-0.1.0-b4
# @copyright © 2020. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ldc-alpine
# @subpackage ldc-console
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
# ========================================================================================

echo
echo "Stopping and removing ahtop-0.1.0-b4"
echo

docker stop ahtop-0.1.0-b4
docker rm ahtop-0.1.0-b4

echo
echo "Installing ahtop-0.1.0-b4 from ldc-console:htop-0.1.0-b4"
echo

docker run \
   --rm \
   --pid=host \
   --userns=host \
   \
   -e RUN_APP="htop" \
   -it \
   \
   -e LMS_BASE="${HOME}/.local" \
   -e LMS_HOME="${HOME}" \
   -e LMS_CONF="${HOME}/.config" \
   \
   -v /etc/localtime:/etc/localtime:ro \
   \
   -v ${HOME}/bin:/userbin \
   -v ${HOME}/.local:/usrlocal \
   -v ${HOME}/.config/docker:/conf \
   -v ${HOME}/.config/docker/ldc-console-htop-0.1.0:${HOME} \
   -v ${HOME}/.config/docker/ldc-console-htop-0.1.0/workspace:/workspace \
   \
   --name ahtop-0.1.0-b4 \
 ewsdocker/ldc-console:htop-0.1.0-b4
[[ $? -eq 0 ]] ||
 {
 	echo "ewsdocker/ldc-console:htop-0.1.0-b4 failed"
 	exit 2
 }

echo
echo "Installation of ahtop-0.1.0-b4 was successful"
echo

exit 0
