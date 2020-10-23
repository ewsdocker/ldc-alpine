# ewsdocker/alpine-htop
--------------------- 

This is a very small (16 MB) **Alpine Linux** docker implementation of the *htop* example in the **docker run** reference (see below).  It is a simple example of the use of the built-in **PID Namespace** (*--pid=*) Linux virtualization.

The **Dockerfile** for the *alpine-htop* image is short and simple, and can easily be entered from a console editor.  However, I use this example a lot and have tired of entering it for each use. Hence, this image.

---------------------
### Docker Image
A docker image is available for download from **[ewsdocker/alpine-htop](https://hub.docker.com/r/ewsdocker/alpine-htop)** on **[Docker Hub](https://hub.docker.com/)**

    docker pull ewsdocker/alpine-htop

---------------------

### Dockerfile

    FROM ewsdocker/alpine-base:3.10.0
    RUN apk add --update htop && rm -rf /var/cache/apk/*
    CMD ["htop"]**  

---------------------  

### Running alpine-htop  
The following line will install and run **[ewsdocker/alpine-htop](https://hub.docker.com/r/ewsdocker/alpine-htop)**:

    docker run -it --rm --pid=host --userns=host --name=htop ewsdocker/alpine-htop:3.10.0 

---------------------

### Exiting alpine-htop
The container is exited by giving focus to the container and then using the *ctrl-c* keyboard combination to exit the container. 

***
#### Licensed under the GNU General Public License, GPL-3.0-or-later.
Read the license at https://github.com/ewsdocker/alpine-htop/wiki/License

---------------------

### Attribution

 Based on example **run htop inside a container** from the **docker run** reference at 
 https://docs.docker.com/engine/reference/run/#example-run-htop-inside-a-container
