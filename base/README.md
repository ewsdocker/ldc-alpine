

__Preliminary Documentation__ - 2020-10-14
____  
### ewsdocker/ldc-alpine:abase:3.12.0

**ewsdocker/ldc-alpine:abase** is based upon the latest (**edge**) version of the [nimmis/alpine-micro](https://github.com/nimmis/alpine-micro) docker image. It adds several system utilities and libraries that are nominally required to properly utilize the **library/alpine** docker image.  

______  

A pre-made docker image of **ewsdocker/ldc-alpine:abase** is available from [ewsdocker/ldc-alpine:abase](https://hub.docker.com/r/ewsdocker/ldc-alpine:abase/) at [Docker Hub](https://hub.docker.com).  
______  


**Installing ewsdocker/ldc-alpine:abase**  

The following scripts will download the the selected **ewsdocker/ldc-alpine:abase** image, create a container, setup and populate the directory structures, create the run-time scripts, and install the application's desktop file(s).  

The <i>default</i> values will install all directories and contents in the <b>docker host</b> user's home directory (refer to <a href="#mapping">Mapping docker host resources to the docker container</a>, below).  

**ewsdocker/ldc-alpine:abase:3.12.0**
  
    docker run --rm \
               -v ${HOME}/bin:/userbin \
               -v ${HOME}/.local:/usrlocal \
               -e LMS_BASE="${HOME}/.local" \
               -v ${HOME}/.config/docker:/conf \
               -v ${HOME}/.config/docker/ldc-alpine:abase-3.12.0:/root \
               --name=ldc-alpine:abase-3.12.0 \
           ewsdocker/ldc-alpine:abase:3.12.0 lms-setup-alpine  

____  

**Running the installed scripts**

After running the above command script, and using the settings indicated, the docker host directories, mapped as shown in the above tables, will be configured as follows:

 - the executable scripts have been copied to **~/bin**;  
 - the application desktop file(s) have been copied to **~/.local/share/applications**, and are availablie in any _task bar_ menu;  
 - the associated **ldc-alpine:abase-"version"** executable script (shown below) will be found in **~/.local/bin**, and _should_ be customized with proper local volume names;  

____  

**Execution scripts**  

**ewsdocker/ldc-alpine:abase:3.12.0**  
  
    docker run -d \
           --rm \
           -v /etc/localtime:/etc/localtime:ro \
           -v ${HOME}/workspace-base-3.12.0:/workspace \
           -v ${HOME}/.config/docker/ldc-alpine:abase-3.12.0:/root \
           --name=ldc-alpine:abase-3.12.0 \
       ewsdocker/ldc-alpine:abase:3.12.0  

____  


**Packages**  

Among the additional packages are   

  - **bash**
  - **bash-completion**  
  - **binutils** 
  - **coreutils**
  - **dbus**
  - **findutils**
  - **grep**
  - **nano**
  - **pciutils**
  - **shadow**
  - **usbutils**
  - **util-linux**
  - **wget** 
  - **zip**

______  

**Visit the [ewsdocker/ldc-alpine:abase Wiki](https://github.com/ewsdocker/ldc-alpine:abase/wiki/QuickStart) for complete documentation of this docker image.**  

____  

