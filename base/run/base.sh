#!/bin/bash
# ========================================================================================
# ========================================================================================
#
#      Run/Install file for abase-3.12.0 from ldc-alpine:abase-3.12.0.
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version abase-3.12.0
# @copyright © 2020. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ldc-alpine
# @subpackage build
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
echo "Stopping and removing abase-3.12.0"
echo

docker stop abase-3.12.0
docker rm abase-3.12.0

echo
echo "Installing and starting abase-3.12.0 from ewsdocker/ldc-alpine:abase-3.12.0"
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
   -v ${HOME}/.config/docker:/conf \
   -v ${HOME}/.config/docker/ldc-alpine-abase-0.1.0:${HOME} \
   -v ${HOME}/.config/docker/ldc-alpine-abase-0.1.0/workspace:/workspace \
   \
   --name abase-3.12.0 \
 ewsdocker/ldc-alpine:abase-3.12.0
[[ $? -eq 0 ]] ||
 {
 	echo "Unable to install/run abase-3.12.0 from ewsdocker/ldc-alpine:abase-3.12.0"
 	exit 2
 }

echo
echo "Successfully installed abase-3.12.0 from ewsdocker/ldc-alpine:abase-3.12.0"
echo

exit 0