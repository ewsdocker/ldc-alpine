#!/bin/bash

# ===================================================================================
# ===================================================================================
#
#	nginx.sh
#
# ===================================================================================
#
# @author Jay Wheeler.
# @version 0.1.0
# @copyright © 2020. EarthWalk Software.
# @license Licensed under the GNU General Public License, GPL-3.0-or-later.
# @package ewsdocker/ldc-alpine
# @subpackage ldc-server:nginx
#
# ==========================================================================
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
#   along with ewsdocker/ldc-alpine.  
#
#   If not, see <http://www.gnu.org/licenses/>.
#
# ==========================================================================
# ==========================================================================

declare instList=" "

# =========================================================================
#
#	addPkg
#		add specified package to install list
#
#   Enter:
#		instPkg = "package" name to add to the installation list
#		instComment = comment... not used, but tolerated for documentation
#
# =========================================================================
function addPkg()
{
	local instPkg="${1}"
	local instComment="${2}"

    printf -v instList "%s %s" "${instList}" "${instPkg}"
    return 0
}

# =========================================================================
#
#	installList
#		the instList has been build, now execute it
#
#   Enter:
#		none
#
# =========================================================================
function installList()
{
	echo ""
	echo "$instList"
	echo ""

	$instList
	[[ $? -eq 0 ]] || return $?

    return 0
}

# =========================================================================
#
#	installPackage
#		download & install requested package
#
#   Enter:
#		instPkg = "package" name downloaded - what you are going to extract from
#		instUrl = server to download the pkg from
#		instDir = directory to extract to
#
# =========================================================================
function installPackage()
{
	local instPkg="${1}"
	local instUrl="${2}"
	local instDir="${3}"

    wget "${instUrl}" 
    [[ $? -eq 0 ]] || return $?

    tar -xvf "${instPkg}" -C "${instDir}" 
    [[ $? -eq 0 ]] || return $?

    rm "${instPkg}"

    return 0
}

# =========================================================================
#
#	addNginxReqs
#
#   Enter:
#       none
#   Exit:
#       0 = no error
#       non-zero = error code
#
# =========================================================================
function addNginxReqs()
{
    addPkg "gmp"
    addPkg "isl"
    addPkg "libgomp"
    addPkg "libatomic"
    addPkg "libgphobos"
    addPkg "mpfr4"
    addPkg "mpc1"
    addPkg "gcc"
    addPkg "musl-dev"
    addPkg "libc-dev"
    addPkg "make"
    addPkg "openssl-dev"
    addPkg "libpcre16"
    addPkg "libpcre32"
    addPkg "libpcrecpp"
    addPkg "pcre-dev"
    addPkg "zlib-dev"
    addPkg "linux-headers"
    addPkg "libgpg-error"
    addPkg "libassuan"
    addPkg "libcap"
    addPkg "libffi"
    addPkg "libintl"
    addPkg "glib"
    addPkg "libgcrypt"
    addPkg "libsecret"
    addPkg "pinentry"
    addPkg "libbz2"
    addPkg "nettle"
    addPkg "p11-kit"
    addPkg "libtasn1"
    addPkg "gnutls"
    addPkg "libksba"
    addPkg "db"
    addPkg "libsasl"
    addPkg "libldap"
    addPkg "npth"
    addPkg "sqlite-libs"
    addPkg "gnupg"
    addPkg "xz-libs"
    addPkg "libxml2"
    addPkg "libxslt"
    addPkg "xz-dev"
    addPkg "libxml2-dev"
    addPkg "libxslt-dev"
    addPkg "brotli-libs"
    addPkg "libpng"
    addPkg "freetype"
    addPkg "libjpeg-turbo"
    addPkg "libwebp"
    addPkg "libgd"
    addPkg "gd"
    addPkg "perl"
    addPkg "gd-dev"
    addPkg "geoip"
    addPkg "geoip-dev"
    addPkg ".build-deps"

	return 0
}

# =========================================================================
# =========================================================================

#apk update
#apk upgrade

instList="apk add "

addNginxReqs
[[ $? -eq 0 ]] || exit $?

#installList

#rm -rf /var/cache/apk/*

# =========================================================================

mkdir -p /tmp

# =========================================================================

exit 0

