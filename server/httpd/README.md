
__Preliminary Documentation__ - 2020-04-21
____  
## ewsdocker/alpine-apache


A __Docker Alpine__-based __Apache2__ Server based on the latest release
of  
__httpd:2.4.43-alpine__ from 
[The Apache HTTP Server Project](https://hub.docker.com/_/httpd).  

### Availability  

__Source: [GIT Repository](https://github.com/ewsdocker/alpine-apache)__  
__Docker Image: [ewsdocker/alpine-apache](https://hub.docker.com/repository/docker/ewsdocker/alpine-apache)__  

____  

__Getting the source__  

    git clone https://github.com/ewsdocker/alpine-apache  

__Getting pre-built image__

    docker pull ewsdocker/alpine-apache:2.4.43  

  or  

    docker pull ewsdocker/alpine-apache:latest  

__Building and Installing__  

In the following 2 examples, in the _install (or run)_ phase, the volume line 
(-v) must be modified to point to the host directory to point to the 
actual files to be served.  

  __Manual Build (from GIT clone)__  

    docker build --file=Dockerfile -t ewsdocker/alpine-apache:2.4.43 .  

  __Manual Install (from GIT or Docker)__  

    docker run \
      -d \
      -it \
      --restart unless-stopped \      
      --name httpd \
      -p 80:80 \
      -v ${HOME}/Development/ewsldc/ldc-framework/docs/:/usr/local/apache2/htdocs/ \
    ewsdocker/alpine-apache:2.4.43  

  __Build and Install Script (from GIT clone)__
  
  Navigate to the _builds_ directory in the alpine-apache source directory
  and run the script named  

    ./build-httpd.sh  

  (you may have to make it an executable file).

