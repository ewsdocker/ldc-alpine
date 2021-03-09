#!/bin/bash

. ~/Development/ewsldc/ldc/ldc-common.sh

# =====================================================================
#
#    runScript
#        Build the docker container
#
#    Enter:
#        scriptName = the name of the script
#        runName = the name of the script to run
#    Exit:
#        0 = no error
#        non-zero = error code
#
# =====================================================================
function runScript()
{
    local scriptName=${1:-""}
    local runName=${2:-""}

    [[ -z "${scriptName}" || -z "runName" ]] && exit 3

    run/${runName}.sh
	[[ $? -eq 0 ]] || exit 4
}

# =====================================================================
#
#    buildScript
#        Build the docker image
#
#    Enter:
#        scriptName = the name of the script
#    Exit:
#        0 = no error
#        non-zero = error code
#
# =====================================================================
function buildScript()
{
    local scriptName=${1:-""}

    [[ -z "${scriptName}" ]] && exit 1

    build/${scriptName}.sh
	[[ $? -eq 0 ]] || exit 2
}

# ===============================================
#
# ldc-alpine
#
# ===============================================

#cd ~/Development/ewsldc/ldc-alpine/server/httpd

#  cd ../httpd
#  buildScript "httpd"
#   runScript "httpd" "ewsweb-httpd"
#   runScript "httpd" "ewsldc-httpd"
#   runScript "httpd" "ewsdocker-httpd"

#  cd ~/Development/ewsldc/ldc-alpine/server/nginx
#  buildScript "nginx"
#   runScript "nginx" "anginx-ewsdocker"
#   runScript "nginx" "anginx-ewsldc"

  #cd ../nginx-dev
  #buildScript "nginx-dev"

# ===================================================================

