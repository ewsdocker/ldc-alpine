#!/bin/bash
# ========================================================================================
# ========================================================================================
#
#      Run/Install file for abase-0.1.0-b4 from ldc-foundation:base-0.1.0-b4.
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version ldc-foundation-base-0.1.0-b4
# @copyright © 2020. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ldc-alpine
# @subpackage ldc-foundation
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
echo "Stopping and removing abase-0.1.0-b4"
echo

docker stop abase-0.1.0-b4
docker rm abase-0.1.0-b4

echo
echo "Installing and starting abase-0.1.0-b4 from ewsdocker/ldc-foundation:base-0.1.0-b4"
echo

docker run \
   -d \
   --rm \

[[ $? -eq 0 ]] ||
 {
 	echo "Unable to install/run abase-0.1.0-b4 from ewsdocker/ldc-foundation:base-0.1.0-b4"
 	exit 2
 }

echo
echo "Successfully installed abase-0.1.0-b4 from ewsdocker/ldc-foundation:base-0.1.0-b4"
echo

exit 0
