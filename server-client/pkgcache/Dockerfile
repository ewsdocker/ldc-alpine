# ========================================================================================
# ========================================================================================
#
#    Dockerfile
#      Dockerfile for ldc-server-client:pkgcache image.
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version 0.1.0-b4
# @copyright © 2018, 2020. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ldc-alpine
# @subpackage ldc-server-client
#
# ========================================================================================
#
#	Copyright © 2018, 2020. EarthWalk Software
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
#
# ========================================================================================

ARG FROM_REPO="ewsdocker"
ARG FROM_PARENT="ldc-server-client"
ARG FROM_VERS="nginx"
ARG FROM_EXT="-0.1.0"
ARG FROM_EXT_MOD="-b4"

FROM ${FROM_REPO}/${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}

# =========================================================================

ARG FROM_REPO
ARG FROM_PARENT
ARG FROM_VERS
ARG FROM_EXT
ARG FROM_EXT_MOD

# =========================================================================

ARG DNAME
ARG RUN_APP

# =========================================================================

ARG BUILD_REGISTRY
ARG BUILD_REPO

ARG BUILD_NAME 
ARG BUILD_VERSION
ARG BUILD_VERS_EXT
ARG BUILD_EXT_MOD

# =========================================================================

ARG BUILD_TEMPLATE
ARG BUILD_DAEMON

# =========================================================================

ARG BUILD_CATEGORIES
ARG BUILD_DESKTOP
ARG BUILD_ICON

# =========================================================================

ARG OPT_DEBUG
ARG OPT_TIMEOUT
ARG OPT_QUIET

# =========================================================================

ENV DSTACK=${DNAME:-"APKGCACHE"}

# =========================================================================

ENV \
    LMS_DAEMON=${BUILD_DAEMON:-"0"} \
    LMS_TEMPLATE=${BUILD_TEMPLATE:-"console"} \
    LRUN_APP=${RUN_APP:-"bash"} \
    \
    LMSOPT_TIMEOUT=${OPT_TIMEOUT:-"30"} \
    LMSOPT_QUIET=${OPT_QUIET:-"1"} \
    LMSOPT_DEBUG=${OPT_DEBUG:-"0"} \
    \
    LMS_BASE="/usr/local" \
    LMS_HOME= \
    LMS_CONF= \
    \
    LMS_CATEGORIES=${BUILD_CATEGORIES:-"Internet"} \
    LMS_DESKTOP=${BUILD_DESKTOP:-"apkgcache-client"} \
    LMS_ICON=${BUILD_ICON:-"default.png"} \
    \
    LMS_FROM="${FROM_REPO}/${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}" \
    LMS_PARENT="${FROM_REPO}/${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}" \
    \
    LMS_REGISTRY=${BUILD_REGISTRY:-""} \
    LMS_REPO=${BUILD_REPO:-"ewsdocker"} \
    LMS_NAME=${BUILD_NAME:-"ldc-server-client"} \
    LMS_VERSION=${BUILD_VERSION:-"pkgcache"} \
    LMS_VERS_X=${BUILD_VERS_EXT:-"-0.1.0"} \
    LMS_VERS_MOD=${BUILD_EXT_MOD:-"-b4"} 

ENV LMS_VERS_EXT="${LMS_VERS_X}${LMS_VERS_MOD}" 

ENV LMS_PACKAGE="${LMS_PARENT}, ${LMS_DESKTOP}${LMS_VERS_EXT}"

ENV LMS_RUN_NAME="${LMS_NAME}-${LMS_VERSION}${LMS_VERS_EXT}" \
    LMS_DOCKER_NAME="${LMS_NAME}:${LMS_VERSION}${LMS_VERS_EXT}"

ENV LMS_DOCKER="${LMS_REPO}/${LMS_DOCKER_NAME}"

# =========================================================================

COPY scripts/. /

# =========================================================================

RUN chmod -R 775 /usr/local/bin \
 \
 && apk update \
 && apk upgrade \
 && rm -rf /var/cache/apk/* \
 \
 && printf "${LMS_DOCKER} (${LMS_PACKAGE}), %s @ %s\n" `date '+%Y-%m-%d'` `date '+%H:%M:%S'` >> /etc/ewsdocker-builds.txt 

# =========================================================================

VOLUME /workspace
VOLUME /conf
VOLUME /usrlocal

ENV HOME /root
WORKDIR /root

# =========================================================================

CMD ["/bin/bash"]
