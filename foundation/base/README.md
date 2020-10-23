<b><u>Preliminary Documentation</u></b> - 2020-10-16
<hr />
<b>ewsdocker/ldc-alpine:acore-0.1.0-b4</b>

<ul>
 <p>
  The <i>ldc-alpine:acore</i> project extends the 
  <a href="https://github.com/nimmis/alpine-micro">nimmis/alpine-micro:3.12</a>
  docker image, which extends <i>alpine:3.12.0</i> to add an enhanced supervisor,
  system initializer and system software for better system control. 
 </p>

 <p>
  <i>ldc-alpine:acore</i> adds system utilities and libraries to form the 
  <i>base</i> image in the <b>LDC Alpine</b> stack. It must be extended to be useful.
 </p>

 <p>
  <i>ldc-alpine:acore</i> is the foundation frame of the <b>LDC Alpine</b> stack. 
  All other frames are built upon this stack.
 </p>
</ul>

______  

<b><u>Docker Image</u></b>  
<ul>  
A pre-made docker image of <i>ewsdocker/ldc-alpine:acore-0.1.0-b4</i> is available from <a href="https://hub.docker.com/r/ewsdocker/ldc-alpine:acore/">ewsdocker/ldc-alpine:acore</a> at <a href="https://hub.docker.com">Docker Hub</a>.  
<p>
The image may be downloaded to build locally (refer to <i>Building the ewsdocker/ldc-alpine:acore docker image</i>, below), or downloaded automatically using the <i>Run</i> command (refer to <i>Creating the acore:0.1.0-b4 container</i>, below).
</p>
</ul>  

______  

<b><u>Building the ewsdocker/ldc-alpine:acore docker image.</u></b>  
<p>

    docker build \
      --build-arg DNAME="ACORE" \
      \
      --build-arg BUILD_DAEMON="1" \
      --build-arg BUILD_TEMPLATE="daemon" \
      \
      --build-arg BUILD_NAME="ldc-alpine" \
      --build-arg BUILD_VERSION="acore" \
      --build-arg BUILD_VERS_EXT="-0.1.0" \
      --build-arg BUILD_EXT_MOD="-b4" \
      \
      --build-arg FROM_REPO="" \
      --build-arg FROM_PARENT="nimmis" \
      --build-arg FROM_VERS="alpine-micro" \
      --build-arg FROM_EXT="-3.12" \
      --build-arg FROM_EXT_MOD="" \
      \
      --file=Dockerfile \
    -t ewsdocker/ldc-alpine:acore-0.1.0-b4 .  


</p>  

<hr />

<b><u>Creating the acore:0.1.0-b4 container.</u></b>

<p>
    Creating and running the <i>acore</i> container is <b>optional</b>, but recommended.  
    The <i>docker run</i> script will install a copy of the run script and create 
    several standard host-to-container mount-points.  
    The container will automatically remove itself after a successful run.
</p>

<p>

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
       -v ${HOME}/.config/docker/ldc-alpine-acore-0.1.0:${HOME} \  
       -v ${HOME}/.config/docker/ldc-alpine-acore-0.1.0/workspace:/workspace \  
       \  
       --name acore-0.1.0-b4 \  
     ewsdocker/ldc-alpine:acore-0.1.0-b4  

</p>

<p>
 After running the above command script, the docker host directories will be 
 configured as follows:
 <ul>
  <li>the executable scripts have been copied to <b>~/bin</b>;</li>
  <li>the associated <b>ldc-alpine-acore-0.1.0-b4</b> <i>docker run</i> script 
      may be found in the <b>~/.local/bin</b> docker host directory.
  </li>
 </ul>
</p>  

<hr /> 

Visit the <a href="https://github.com/ewsdocker/ldc-alpine:acore/wiki/QuickStart">ewsdocker/ldc-alpine:acore Wiki</a> for complete documentation of this docker image.  

<hr />

<p>
 Copyright © 2016-2020. EarthWalk Software
 <br/>
 Licensed under the GNU General Public License, GPL-3.0-or-later.
</p>

<p>
 This file is part of ewsdocker/ldc-alpine.
</p>

<p>
 ewsdocker/ldc-alpine is free software: you can redistribute 
 it and/or modify it under the terms of the GNU General Public License 
 as published by the Free Software Foundation, either version 3 of the 
 License, or (at your option) any later version.
</p>

<p>
 ewsdocker/ldc-alpine is distributed in the hope that it will 
 be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
 of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
</p>

<p>
 You should have received a copy of the GNU General Public License
 along with ewsdocker/ldc-alpine.  
 If not, see 
 <a href="http://www.gnu.org/licenses/">http://www.gnu.org/licenses/</a>.
</p>

<hr />
