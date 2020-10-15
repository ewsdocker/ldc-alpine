# ========================================================================================
# ========================================================================================
#
#    Dockerfile
#      Dockerfile for ldc-alpine:abase container.
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version 3.12.0
# @copyright © 2016-2020. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ldc-alpine
# @subpackage Dockerfile
#
# ========================================================================================
#
#	Copyright © 2016-2020. EarthWalk Software
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

ARG FROM_REPO="nimmis"
ARG FROM_PARENT="alpine-micro"
ARG FROM_VERS="3.12"
ARG FROM_EXT=""
ARG FROM_EXT_MOD=""

FROM ${FROM_REPO}/${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}

MAINTAINER Jay Wheeler <EarthWalkSoftware@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# =========================================================================

ARG FROM_REPO
ARG FROM_PARENT
ARG FROM_VERS
ARG FROM_EXT
ARG FROM_EXT_MOD

# =========================================================================

ARG DNAME

# =========================================================================

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

ENV DSTACK=${DNAME:-""}

# =========================================================================

ENV \
    LMS_DAEMON=${BUILD_DAEMON:-"1"} \
    LMS_TEMPLATE=${BUILD_TEMPLATE:-"daemon"} \
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
    LMS_CATEGORIES=${BUILD_CATEGORIES:-"System"} \
    LMS_DESKTOP=${BUILD_DESKTOP:-"ldc-alpine:abase"} \
    LMS_ICON=${BUILD_ICON:-"default.png"} \
    \
    LMS_FROM="${FROM_REPO}/${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}" \
    LMS_PARENT="${FROM_REPO}/${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}" \
    \
    LMS_REGISTRY=${BUILD_REGISTRY:-""} \
    LMS_REPO=${BUILD_REPO:-"ewsdocker"} \
    \
    LMS_NAME=${BUILD_NAME:-"ldc-alpine"} \
    LMS_VERSION=${BUILD_VERSION:-"abase"} \
    LMS_VERS_X=${BUILD_VERS_EXT:-"-3.12.0"} \
    LMS_VERS_MOD=${BUILD_EXT_MOD:-""} 

ENV LMS_VERS_EXT="${LMS_VERS_X}${LMS_VERS_MOD}" 

ENV LMS_PACKAGE="${LMS_PARENT}, ${LMS_DESKTOP}${LMS_VERS_EXT}"

ENV LMS_RUN_NAME="${LMS_NAME}-${LMS_VERSION}${LMS_VERS_EXT}" \
    LMS_DOCKER_NAME="${LMS_NAME}:${LMS_VERSION}${LMS_VERS_EXT}"

ENV LMS_DOCKER="${LMS_REPO}/${LMS_DOCKER_NAME}"

# =========================================================================

VOLUME /userbin
VOLUME /workspace

# =========================================================================

COPY scripts/. /

# =========================================================================

RUN apk update \
 && apk upgrade \
 && apk add bash \
            bash-doc \
            bash-completion \
            binutils \
            coreutils \
            curl \
            dbus \
            findutils \
            grep \
            pciutils \
            shadow \
            unzip \
            usbutils \
            util-linux \
            wget \
            zip \
 && rm -rf /var/cache/apk/* \
 \
 && ln -s /usr/bin/ldc/setup-alpine /usr/bin/ldc-setup-alpine \
 && ln -s /usr/bin/ldc/alpine-version /usr/bin/ldc-alpine-version \
 && chmod -R 775 /usr/local/bin/* \
 && chmod -R +x /usr/bin/* \
 \
 # =========================================================================
 #
 #   register the build with /etc/ewsdocker-builds.txt
 #
 # =========================================================================
 \
 && printf "${LMS_DOCKER} (${LMS_PARENT}), %s @ %s\n" `date '+%Y-%m-%d'` `date '+%H:%M:%S'` >> /etc/ewsdocker-builds.txt

# =========================================================================

CMD ["/bin/bash"]
