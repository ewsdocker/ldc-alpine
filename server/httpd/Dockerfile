# ========================================================================================
# ========================================================================================
#
#    Dockerfile
#      Dockerfile for httpd-2.4.46-alpine.
#
# ========================================================================================
#
# @author Jay Wheeler.
# @version 2.4.46-alpine
# @copyright © 2020. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package httpd-alpine
# @subpackage Dockerfile
#
# ========================================================================================
#
#	Copyright © 2020. EarthWalk Software
#	Licensed under the GNU General Public License, GPL-3.0-or-later.
#
#   This file is part of ewsdocker/httpd-alpine.
#
#   ewsdocker/httpd-alpine is free software: you can redistribute 
#   it and/or modify it under the terms of the GNU General Public License 
#   as published by the Free Software Foundation, either version 3 of the 
#   License, or (at your option) any later version.
#
#   ewsdocker/httpd-alpine is distributed in the hope that it will 
#   be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
#   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with ewsdocker/httpd:2.4.46-alpine.  If not, see 
#   <http://www.gnu.org/licenses/>.
#
# ========================================================================================
# ========================================================================================

#
#	select the httpd:2.4.46-alpine Apache server from the docker library
#		This will cause a download from docker if the file is not already present.
#
ARG FROM_REPO=""
ARG FROM_PARENT="httpd"
ARG FROM_VERS="2.4.46"
ARG FROM_EXT="-alpine"
ARG FROM_EXT_MOD=""

FROM ${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}

# ========================================================================================
#
# docker build --file=Dockerfile -t ewsdocker/ldc-server:httpd-0.1.0-b4 .
#
# docker run -dit --name httpd-0.1.0-b4 -p 80:80 -v ${HOME}/public_html/:/usr/local/apache2/htdocs/ ewsdocker/ldc-server:httpd-0.1.0-b4
#
# ========================================================================================

ARG FROM_REPO
ARG FROM_PARENT
ARG FROM_VERS
ARG FROM_EXT
ARG FROM_EXT_MOD

# ========================================================================================

ARG RUN_APP

# ========================================================================================

ARG BUILD_REGISTRY
ARG BUILD_REPO

ARG BUILD_NAME 
ARG BUILD_VERSION
ARG BUILD_VERS_EXT
ARG BUILD_EXT_MOD

# ========================================================================================

ARG BUILD_TEMPLATE
ARG BUILD_DAEMON
ARG BUILD_BASE

# ========================================================================================

ARG LANG

# ========================================================================================

ARG OPT_DEBUG
ARG OPT_QUIET
ARG OPT_TIMEOUT

# ========================================================================================

ARG DNAME

# ========================================================================================
# ========================================================================================

ENV DSTACK=${DNAME:-"UNKNOWN"}

ENV \
    LMS_DAEMON=${BUILD_DAEMON:-"0"} \
    LMS_TEMPLATE=${BUILD_TEMPLATE:-"gui"} \
    LRUN_APP=${RUN_APP:-"httpd"} \
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
    LMS_DESKTOP=${BUILD_DESKTOP:-"httpd"} \
    LMS_ICON=${BUILD_ICON:-"Cpp.png"} \
    \
    LMS_FROM="${FROM_REPO}/${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}" \
    LMS_PARENT="${FROM_REPO}/${FROM_PARENT}:${FROM_VERS}${FROM_EXT}${FROM_EXT_MOD}" \
    \
    LMS_REGISTRY=${BUILD_REGISTRY:-""} \
    LMS_REPO=${BUILD_REPO:-"ewsdocker"} \
    \
    LMS_NAME=${BUILD_NAME:-"ldc-server"} \
    LMS_VERSION=${BUILD_VERSION:-"httpd"} \
    LMS_VERS_X=${BUILD_VERS_EXT:-"-0.1.0"} \
    LMS_VERS_MOD=${BUILD_EXT_MOD:-"-b4"} 

ENV LMS_VERS_EXT="${LMS_VERS_X}${LMS_VERS_MOD}" \
    LMS_PACKAGE="${LMS_PARENT}, ${LMS_DESKTOP} ${EC_RELEASE}-${EC_VERS}"

ENV LMS_RUN_NAME="${LMS_NAME}-${LMS_VERSION}${LMS_VERS_EXT}" \
    LMS_DOCKER_NAME="${LMS_NAME}:${LMS_VERSION}${LMS_VERS_EXT}"

ENV LMS_DOCKER="${LMS_REPO}/${LMS_DOCKER_NAME}"

# ========================================================================================

ENV LANG_LOCALE=${LANG:-"en_US"}

# =========================================================================

VOLUME /library
VOLUME /source
VOLUME /userbin
VOLUME /workspace

# =========================================================================

COPY scripts/. /

# =========================================================================

EXPOSE 80 443

