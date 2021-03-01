#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# =====================================================================
#
#    removeContainer
#        Stop and Remove the container
#
#    Enter:
#        limageName = the name of the image base (core, base, etc.)
#        lcontainerName = name of the container
#        lrunName = 0 - standard, non-zero = shortened name
#    Exit:
#        none
#
# =====================================================================
function removeContainer()
{
    local limageName="${1}"
    local lcontainerName="${2}"
    local lrunName=${3:-"_"}

    if [[ "${lrunName}" -eq "_" ]]
    then
        echo "Removing container: ldc-${limageName}-${lcontainerName}${ldcvers}${ldcextv}"

        docker stop "ldc-${limageName}-${lcontainerName}${ldcvers}${ldcextv}" >/dev/null 2>/dev/null
        docker rm "ldc-${limageName}-${lcontainerName}${ldcvers}${ldcextv}"  >/dev/null 2>/dev/null
    else
        echo "Removing container: limageName = ${limageName}, lcontainerName = ${lcontainerName}, lrunName = ${lrunName}"

        docker stop "${lrunName}"  >/dev/null 2>/dev/null
        docker rm   "${lrunName}"  >/dev/null 2>/dev/null
    fi
}

# =====================================================================
#
#    removeImage
#        Remove the ewsdocker image
#
#    Enter:
#        limageName = the name of the image base (core, base, etc.)
#        lcontainerName = name of the container
#    Exit:
#        none
#
# =====================================================================
function removeImage()
{
    local limageName="${1}"
    local lcontainerName="${2}"

    removeContainer "${limageName}" "${lcontainerName}"

    echo "Removing image: ewsdocker/ldc-${limageName}:${lcontainerName}${ldcvers}${ldcextv}"

    docker rmi "ewsdocker/ldc-${limageName}:${lcontainerName}${ldcvers}${ldcextv}" >/dev/null 2>/dev/null

	echo ""
}

# =====================================================================
#
#    Start of program script
#
# =====================================================================

echo "*****************************************************************************"
echo
echo "Removing all docker ldc images and containers"
echo
echo "*****************************************************************************"

cd ~/Development/ewsldc/ldc-alpine/console

cd ../console
#
#
removeImage "console" "htop"

cd ../server-client
#
#
removeImage     "server-client" "nginx"

#server-client:pkgcache-0.1.0-b4 apkgcache
#
removeContainer "server-client" "pkgcache" "apkgcache"
removeImage     "server-client" "pkgcache"

cd ../server
#
#
#server:nginx-pkgcache-0.1.0-b4  anginx-pkgcache
#
removeContainer "server" "nginx-pkgcache" "anginx-pkgcache"
removeImage     "server" "nginx-pkgcache"

removeImage     "server" "nginx"

#server:httpd-0.1.0-b4           ewsdocker-httpd
#server:httpd-0.1.0-b4           ewsldc-httpd
#server:httpd-0.1.0-b4           web-httpd
#server:httpd-0.1.0-b4           httpd
#
removeContainer "server" "httpd" "ewsdocker-httpd"
removeContainer "server" "httpd" "ewsldc-httpd"
removeContainer "server" "httpd" "web-httpd"
removeContainer "server" "httpd" "httpd"
removeImage     "server" "httpd"
#
#
cd ../foundation
#
#
removeImage "foundation" "base"
removeImage "foundation" "core"
#
#

echo "*****************************************************************************"
echo
echo "Removal complete"
echo
echo "*****************************************************************************"

