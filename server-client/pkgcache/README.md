### ewsdocker/alpine-pkgcache-client:3.10.0

**ewsdocker/alpine-pkgcache-client** is a simple **Alpine Linux**-based **Docker** image designed as a console interface to maintain the data and configuration files used by **ewsdocker/alpine-nginx-pkgcache**. 

**ewsdocker/alpine-nginx-pkgcache** is a **NGINX HHTP** Web server image based on [ewsdocker/alpine-nginx](https://github.com/ewsdocker/alpine-nginx).  

**alpine-nginx-pkgcache** provides a method, using only existing Docker containers and Docker resources, to add files to a permanent file-cache and retrieve selected files from the file-cache by a running **Docker build** process.  

Learn about the [pkgcache](https://github.com/ewsdocker/ewsdocker.github.io/wiki/pkgcache") project on the [Advanced Docker Concepts - pkgcache](https://github.com/ewsdocker/ewsdocker.github.io/wiki/pkgcache) Wiki page.  

____  
A pre-made docker image of **ewsdocker/alpine-pkgcache-client** is available from [ewsdocker/alpine-pkgcache-client](https://hub.docker.com/r/ewsdocker/alpine-pkgcache-client/) at [Docker Hub](https://hub.docker.com).  
______  
#### Installing ewsdocker/alpine-pkgcache-client  

The following scripts will download the selected **ewsdocker/alpine-pkgcache-client** image, create a container, setup and populate the directory structures, and create the execution script(s).  

The <i>default</i> values will install all directories and contents in the <b>docker host</b> user's home directory.  
____  
**ewsdocker/alpine-pkgcache-client:latest**
  
    docker run --rm \
               -v ${HOME}/bin:/userbin \
               -v ${HOME}/.local:/usrlocal \
               -e LMS_BASE="${HOME}/.local" \
               -e LMSBUILD_VERSION=latest \
               -v ${HOME}/.config/docker:/conf \
               -v ${HOME}/.config/docker/alpine-pkgcache-client-latest:/root \
               --name=alpine-pkgcache-client-latest \
           ewsdocker/alpine-pkgcache-client:latest lms-setup-alpine  

____  

**ewsdocker/alpine-pkgcache-client:3.10.0**
  
    docker run --rm \
               -v ${HOME}/bin:/userbin \
               -v ${HOME}/.local:/usrlocal \
               -e LMS_BASE="${HOME}/.local" \
               -v ${HOME}/.config/docker:/conf \
               -v ${HOME}/.config/docker/alpine-pkgcache-client-3.10.0:/root \
               --name=alpine-pkgcache-client-3.10.0 \
           ewsdocker/alpine-pkgcache-client:3.10.0 lms-setup-alpine  

____  

#### Running the installed scripts  

After running the above command script, and using the settings indicated, the docker host directories, mapped as shown in the above tables, will be configured as follows:

 - the executable scripts have been copied to **~/bin**;  
 - the application desktop file(s) have been copied to **~/.local/share/applications**, and are availablie in any _task bar_ menu;  
 - the associated **alpine-pkgcache-client-"version"** executable script (shown below) will be found in **~/.local/bin**, and _should_ be customized with proper local volume names.  

Execute the following _docker run_ command to create and start a client container:  
____  
**ewsdocker/alpine-pkgcache-client:latest**
  
The following _docker run_ command creates and starts a client container. It is automatically installed by the _lms-setup-alpine_ script, above:

    docker run -it \
               --rm \
               --network=pkgnet \
               -v /etc/localtime:/etc/localtime:ro \
               -v ${HOME}/source:/source \
               -v ${HOME}/workspace-alpine-pkgcache-client-latest:/workspace \
               --mount source=pkgcache,target=/pkgcache \
               --name=alpine-pkgcache-client-latest \
           ewsdocker/alpine-pkgcache-client:latest  

To create and run the container, enter the following command on the console command-line:

    ~/.local/bin/alpine-pkgcache-client-latest  

____  
**ewsdocker/alpine-pkgcache-client:3.10.0**
  
    docker run -it \
               --rm \
               --network=pkgnet \
               -v /etc/localtime:/etc/localtime:ro \
               -v ${HOME}/source:/source \
               -v ${HOME}/workspace-alpine-pkgcache-client-3.10.0:/workspace \
               --mount source=pkgcache,target=/pkgcache \
               --name=alpine-pkgcache-client-3.10.0 \
           ewsdocker/alpine-pkgcache-client:3.10.0  

To create and run the container, the following should work from the command-line:

    ~/.local/bin/alpine-pkgcache-client-3.10.0  

____  
**Visit the [ewsdocker/alpine-pkgcache-client Wiki](https://github.com/ewsdocker/alpine-pkgcache-client/wiki/QuickStart) for complete documentation of this docker image.**  
____  
#### Exiting the Interactive Shell  

The interactive shell may be exited by entering **exit** at the _bash_ prompt, or running the following command from the docker host running the container  

    docker stop alpine-pkgcache-client-3.10.0   

or  

    docker stop alpine-pkgcache-client-latest  

The following messages will be output:  

    exit
    Shut down

____  

**Copyright © 2018, 2020. EarthWalk Software.**  
**Licensed under the GNU General Public License, GPL-3.0-or-later.**  

This file is part of **ewsdocker/alpine-pkgcache-client**.  

**ewsdocker/alpine-pkgcache-client** is free software: you can redistribute 
it and/or modify it under the terms of the GNU General Public License 
as published by the Free Software Foundation, either version 3 of the 
License, or (at your option) any later version.  

**ewsdocker/alpine-pkgcache-client** is distributed in the hope that it will 
be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.  

You should have received a copy of the GNU General Public License
along with **ewsdocker/alpine-pkgcache-client**.  If not, see 
<http://www.gnu.org/licenses/>.  

