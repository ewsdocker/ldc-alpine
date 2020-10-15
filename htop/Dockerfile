# ========================================================================================
# ========================================================================================
#
#    Dockerfile
#      Dockerfile for alpine-htop container - htop display for docker host.
#
#    Example "run htop inside a container" from the docker run reference at
#        https://docs.docker.com/engine/reference/run/#example-run-htop-inside-a-container
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version 3.10.0
# @copyright © 2018, 2020. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package alpine-htop
# @subpackage Dockerfile
#
# ========================================================================================
#
#	Copyright © 2018, 2020. EarthWalk Software
#	Licensed under the GNU General Public License, GPL-3.0-or-later.
#
#   This file is part of ewsdocker/alpine-htop.
#
#   ewsdocker/alpine-htop is free software: you can redistribute 
#   it and/or modify it under the terms of the GNU General Public License 
#   as published by the Free Software Foundation, either version 3 of the 
#   License, or (at your option) any later version.
#
#   ewsdocker/alpine-htop is distributed in the hope that it will 
#   be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
#   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with ewsdocker/alpine-htop.  If not, see 
#   <http://www.gnu.org/licenses/>.
#
# ========================================================================================
# ========================================================================================
#
#  docker run -it --rm --pid=host --userns=host --name=htop ewsdocker/alpine-htop:3.10.0
#
# ========================================================================================
FROM  ewsdocker/alpine-base:3.10.0

RUN apk add --update htop \
 && rm -rf /var/cache/apk/*
 
CMD ["htop"]
