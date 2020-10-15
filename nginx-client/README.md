### ewsdocker/alpine-nginx-client:3.10.0

**ewsdocker/alpine-nginx-client** is a simple **Alpine Linux**-based **Docker** image designed as a console interface to maintain the data and configuration files used by **ewsdocker/alpine-nginx**. 

______  

A pre-made docker image of **ewsdocker/alpine-nginx-client** is available from [ewsdocker/alpine-nginx-client](https://hub.docker.com/r/ewsdocker/alpine-nginx-client/) at [Docker Hub](https://hub.docker.com).  
______  


**Installing ewsdocker/alpine-nginx-client**  

The following scripts will download the selected **ewsdocker/alpine-nginx-client** image, create a container, setup and populate the directory structures, and create the execution script(s).  

The <i>default</i> values will install all directories and contents in the <b>docker host</b> user's home directory.  

**ewsdocker/alpine-nginx-client:3.10.0**
  
    docker run --rm \
               -v ${HOME}/bin:/userbin \
               -v ${HOME}/.local:/usrlocal \
               -e LMS_BASE="${HOME}/.local" \
               -v ${HOME}/.config/docker:/conf \
               -v ${HOME}/.config/docker/alpine-nginx-client-3.10.0:/root \
               --name=alpine-nginx-client-3.10.0 \
           ewsdocker/alpine-nginx-client:3.10.0 lms-setup-alpine  

____  

**Running the installed scripts**

After running the above command script, and using the settings indicated, the docker host directories, mapped as shown in the above tables, will be configured as follows:

 - the executable scripts have been copied to **~/bin**;  
 - the application desktop file(s) have been copied to **~/.local/share/applications**, and are availablie in any _task bar_ menu;  
 - the associated **alpine-nginx-client-"version"** executable script (shown below) will be found in **~/.local/bin**, and _should_ be customized with proper local volume names.  

The installation documentation for [ewsdocker/alpine-nginx]() shows 2 different examples to install the server.  The connection of **ewsdocker/alpine-nginx-client** to the server depends upon the method of installation, as detailed in the 2 following sections.  

____  

**Docker Volume.**
  
If the **ewsdocker/alpine-nginx** service was installed using the **Docker Volume** example (refer to [ewsdocker/alpine-nginx](https://github.com/ewsdocker/alpine-nginx/wiki)) the **.local/shared/nginx-html** folder (in the calling user's home directory) will contain the html documents to serve.  

Execute the following _docker run_ command to create a client container and start the container using the **Docker Volume** setup:

    docker run -it \
               --rm \
               -v ${HOME}/.local/shared/nginx-html:/usr/share/nginx/html \
               -v /etc/localtime:/etc/localtime:ro \
               -v ${HOME}/source:/source \
               -v ${HOME}/.config/docker/alpine-nginx-client-3.10.0/workspace:/workspace \
               --name=alpine-nginx-3.10.0 \
           ewsdocker/alpine-nginx:3.10.0  
____  
  
**Docker Mount.**
  
If the **ewsdocker/alpine-nginx** service was installed using the **Docker Volume** example (refer to [ewsdocker/alpine-nginx](https://github.com/ewsdocker/alpine-nginx/wiki)), _mount_ option id used to mount a **Docker** volume to be used for the _NGINX_ html folder.  

Execute the following _docker run_ command to create and start a client container :

    docker run -it \
               --rm \
               --mount source=nginx-html,target=/usr/share/nginx/html \
               -v /etc/localtime:/etc/localtime:ro \
               -v ${HOME}/source:/source \
               -v ${HOME}/workspace:/workspace \
               --name=alpine-nginx-3.10.0 \
           ewsdocker/alpine-nginx:3.10.0  
____  
  
To create and run the container, the following should work from the command-line:

    ~/.local/bin/alpine-nginx-3.10.0  

____  

**Visit the [ewsdocker/alpine-nginx-client Wiki](https://github.com/ewsdocker/alpine-nginx-client/wiki/QuickStart) for complete documentation of this docker image.**  

____  

**Copyright © 2018, 2020. EarthWalk Software.**  
**Licensed under the GNU General Public License, GPL-3.0-or-later.**  

This file is part of **ewsdocker/alpine-nginx-client**.  

**ewsdocker/alpine-nginx-client** is free software: you can redistribute 
it and/or modify it under the terms of the GNU General Public License 
as published by the Free Software Foundation, either version 3 of the 
License, or (at your option) any later version.  

**ewsdocker/alpine-nginx-client** is distributed in the hope that it will 
be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.  

You should have received a copy of the GNU General Public License
along with **ewsdocker/alpine-nginx-client**.  If not, see 
<http://www.gnu.org/licenses/>.  

