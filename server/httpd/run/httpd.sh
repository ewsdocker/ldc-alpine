#!/bin/bash
# ========================================================================================
# ========================================================================================
#
#      Run/Install file for ldc-alpine:httpd-2.4.46.
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version httpd-2.4.46
# @copyright © 2020. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package httpd
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
echo "Stopping and removing httpd-2.4.46"
echo

docker stop httpd-2.4.46
docker rm httpd-2.4.46

echo
echo "Installing and starting httpd-2.4.46 from ewsdocker/ldc-alpine:httpd-2.4.46"
echo

docker run \
    -d \
    -it \
	--restart unless-stopped \
    -v ${HOME}/Development:/usr/local/apache2/htdocs/ \
    -p=80:80 \
    --name httpd-2.4.46 \
  ewsdocker/ldc-alpine:httpd-2.4.46
[[ $? -eq 0 ]] ||
 {
 	echo "Unable to install/run httpd-2.4.46 from ewsdocker/ldc-alpine:httpd-2.4.46"
 	exit 2
 }
 
echo
echo "Successfully installed httpd-2.4.46 from ewsdocker/ldc-alpine:httpd-2.4.46"
echo

exit 0
