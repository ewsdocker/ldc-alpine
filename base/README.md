

__Preliminary Documentation__ - 2020-10-14
____  
### ewsdocker/ldc-alpine:abase:3.12.0

**ewsdocker/ldc-alpine:abase** is based upon the newest (**edge**) version of the [nimmis/alpine-micro](https://github.com/nimmis/alpine-micro) docker image. It adds several system utilities and libraries that are nominally required to properly utilize the **library/alpine** docker image.  

______  

<b><u>Docker Image</u></b>  
<ul>  
A pre-made docker image of <i>ewsdocker/ldc-alpine:abase</i> is available from <a href="https://hub.docker.com/r/ewsdocker/ldc-alpine:abase/">ewsdocker/ldc-alpine:abase</a> at <a href="https://hub.docker.com">Docker Hub</a>.  
<p>
The image may be downloaded and built (refer to <i>Building ewsdocker/ldc-alpine:abase</i>, below), or downloaded automatically using the <i>Run</i> command (refer to <i>Creating <b>abase</b></i>, below).
</p>
</ul>  

______  

<b><u>Building ewsdocker/ldc-alpine:abase</u></b>  
<p>

    docker build \
      --build-arg DNAME="ABASE" \
      \
      --build-arg BUILD_DAEMON="1" \
      --build-arg BUILD_TEMPLATE="daemon" \
      \
      --build-arg BUILD_NAME="ldc-alpine" \
      --build-arg BUILD_VERSION="abase" \
      --build-arg BUILD_VERS_EXT="-3.12.0" \
      --build-arg BUILD_EXT_MOD="" \
      \
      --build-arg FROM_REPO="" \
      --build-arg FROM_PARENT="nimmis" \
      --build-arg FROM_VERS="alpine-micro" \
      --build-arg FROM_EXT="-3.12" \
      --build-arg FROM_EXT_MOD="" \
      \
      --file=Dockerfile \
    -t ewsdocker/ldc-alpine:abase-3.12.0 .

</p>  

____  

**Creating the abase:3.12.0 container.**


    docker run \  
       -d \  
       --rm \  
       \  
       -e LMS_BASE="${HOME}/.local" \  
       \  
       -v /etc/localtime:/etc/localtime:ro \  
       \  
       -v ${HOME}/bin:/userbin \  
       -v ${HOME}/.local:/usrlocal \  
       -v ${HOME}/.config/docker:/conf \  
       -v ${HOME}/.config/docker/ldc-alpine-abase-0.1.0:${HOME} \  
       -v ${HOME}/.config/docker/ldc-alpine-abase-0.1.0/workspace:/workspace \  
       \  
       --name abase-3.12.0 \  
     ewsdocker/ldc-alpine:abase-3.12.0  

After running the above command script, and using the settings indicated, the docker host directories, mapped as shown in the above tables, will be configured as follows:
<ul>
 <li>the executable scripts have been copied to <b>~/bin</b>;</li>
 <li>the associated <b>ldc-alpine:abase-"version"</b> executable script (shown below) will be found in <b>~/.local/bin</b>, and <i>should</i> be customized with proper local volume names;</li>
</ul>

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

Visit the [ewsdocker/ldc-alpine:abase Wiki](https://github.com/ewsdocker/ldc-alpine:abase/wiki/QuickStart) for complete documentation of this docker image.  

____  

