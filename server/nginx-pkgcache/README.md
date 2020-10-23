<b>Preliminary Documentation</b> - 2020-10-21

<hr>  

<b>ewsdocker/ldc-alpine:nginx-pkgcache</b>  

<hr>  

<p>
 A <i>Nginx Httpd</i> Web server image based on 
 <a href="https://github.com/ewsdocker/alpine-nginx">
  ewsdocker/ldc-alpine:nginx</a>.
</p>

<p>
 <i>ldc-alpine:nginx-pkgcache</i> provides a method, using only existing
 <i>Docker</i> containers and <i>Docker</i> resources, 
 to add files to a permanent file-cache and retrieve selected files from the 
 file-cache by a running <i>docker build</i>
 process.  
</p>

<p>
 Learn about the 
 <a href="https://github.com/ewsdocker/ewsdocker.github.io/wiki/pkgcache">
  pkgcache</a> 
 project on the 
 <a href="https://github.com/ewsdocker/ewsdocker.github.io/wiki/pkgcache">
  Advanced Docker Concepts - pkgcache</a>
 Wiki page.  
</p>

<hr>

<b>ldc-alpine:nginx-pkgcache</b>
<ul>

 <dl>
  <dt><b>GIT Repository:</b></dt>  
   <dd>
    <a href="https://github.com/ewsdocker/ldc-alpine/tree/master/nginx-pkgcache">
       ewsdocker/ldc-alpine:nginx-pkgcache
    </a>
   </dd>
   
  <dt><b>Docker Repository:</b></dt>
   <dd>
    <a href="https://hub.docker.com/r/ewsdocker/ldc-alpine-nginx-pkgcache/">
       ewsdocker/ldc-alpine:nginx-pkgcache
    </a>
   </dd>
 </dl>

</ul>

<b>Current (Development) Version</b>
<ul>

 <dl>
  <dt><b>Development Version:</b></dt>
   <dd>
    <b>0.1.0-b4</b>
   </dd>
  <dt><b>Status:</b></dt>
   <dd>
    <li>Conversion to LDC incomplete</li>
    <li>Unstable</li>
   </dd>

  <br />

<!--
  <dt><b>GIT Source:</b></dt>  
   <dd>
    <a href="https://github.com/ewsdocker/ldc-alpine/tree/master/nginx-pkgcache">
       ewsdocker/ldc-alpine:nginx-pkgcache
    </a>
   </dd>
-->

  <dt><b>GIT Source:</b></dt>  
   <dd>
    <p>
    <b>Note:</b> If the listed source does not exist, it hasn't been released yet.
    </p>
    <li>
     <a href="https://github.com/ewsdocker/ldc-alpine/archive/0.1.0-b4.tar.gz">
       ewsdocker/ldc-alpine:nginx-pkgcache-0.1.0-b4.tar.gz
     </a>
    </li>
    <li>
     <a href="https://github.com/ewsdocker/ldc-alpine/archive/0.1.0-b4.zip">
       ewsdocker/ldc-alpine:nginx-pkgcache-0.1.0-b4.zip
     </a>
    </li>
   </dd>

  <br />

  <dt><b>Docker Repository:</b></dt>
   <dd>
    <p>
    <b>Note:</b> If the listed repository version does not exist, 
    it hasn't been released yet.
    </p>
    <a href="https://hub.docker.com/r/ewsdocker/ldc-alpine-nginx-pkgcache/">
       ewsdocker/ldc-alpine:nginx-pkgcache
    </a>
   </dd>
 </dl>

</ul>

<hr />

<u>Docker Image</u>
  
<ul>  

 <p>
  A pre-made docker image of <i>ewsdocker/ldc-alpine:nginx-pkgcache</i> 
  <a href="https://hub.docker.com/r/ewsdocker/ldc-alpine:nginx-pkgcache/">
   ewsdocker/ldc-alpine:nginx-pkgcache</a>
  is available from
  <a href="https://hub.docker.com">
   Docker Hub</a>. 
 </p>

 <p>
  The source may be downloaded and built (refer to 
  <i>Building the ewsdocker/ldc-alpine:nginx-pkgcache docker image</i>, below), 
  or downloaded automatically using the <i>Run</i> command 
  (refer to <i>Creating an <b>anginx-pkgcache</b> container</i>, below).
 </p>
</ul>  

<hr />  

<u>Building the 
      ewsdocker/ldc-alpine:nginx-pkgcache <i>docker</i> image.</u>  

<p>
 <ul>
  <u>Downloading the source</u>
  <br />
 </ul>
</p>


<p>
 <ul>
  <u>Building the image</u>
  <br />

    docker build \
      --build-arg DNAME="ANGINX-PKGCACHE" \
      \
      --build-arg BUILD_DAEMON="1" \
      --build-arg BUILD_TEMPLATE="daemon" \
      \
      --build-arg BUILD_NAME="ldc-alpine" \
      --build-arg BUILD_VERSION="nginx-pkgcache" \
      --build-arg BUILD_VERS_EXT="-0.1.0" \
      --build-arg BUILD_EXT_MOD="-b4" \
      \
      --build-arg FROM_REPO="ewsdocker" \
      --build-arg FROM_PARENT="ldc-alpine" \
      --build-arg FROM_VERS="nginx" \
      --build-arg FROM_EXT="-0.1.0" \
      --build-arg FROM_EXT_MOD="-b4" \
      \
      --network=pkgnet \
      \
      --file=Dockerfile \
      -t ewsdocker/ldc-alpine:nginx-pkgcache-0.1.0-b4 .  

 </ul>
</p>

<hr />

<u>Creating an ewsdocker/ldc-alpine:nginx-pkgcache container.</u>

<p>
 Below are presented two examples of the many ways to download, create and start 
 the service container.  Both examples have strengths and weaknesses. 
</p>

<p> 
 <dl>
  <dt>Docker Volume</dt>
  <dd>  
   This is the easiest procedure to understand.  It uses the <i>volume</i> option 
   to map the <i>Nginx</i> html folder in the <i>ldc-alpine:nginx-pkgcache</i> container 
   to a <i>Docker host</i> folder (in the calling user's home folder) 
   to be used for the <i>Nginx</i> html folder.  

</p>
<p>

  <u>An Example</u>
  <ul>
   <p>
    In this example, the <i>~/.local/shared/nginx-html</i> folder 
    (in the calling user's home directory) will contain the html 
    documents to serve.  HTML data (Web Pages) to be served 
    should be added to the <i>nginx-html</i> folder.  
   </p>
   <p>
    Execute the following <i>docker run</i> command to download the image, 
    create a service container and start the service on port 80:
   </p>

    docker run \
        -d \
        --restart unless-stopped \
        \
        -e LMS_BASE="${HOME}/.local" \
        -e LMS_HOME="${HOME}" \
        -e LMS_CONF="${HOME}/.config" \
        \
        -v /etc/localtime:/etc/localtime:ro \
        \
        -v ${HOME}/.local/shared/nginx-html:/usr/share/nginx/html \
        \
        -v ${HOME}/bin:/userbin \
        -v ${HOME}/.local:/usrlocal \
        -v ${HOME}/.config/docker:/conf \
        -v ${HOME}/.config/docker/ldc-alpine-nginx-pkgcache-0.1.0:${HOME} \
        -v ${HOME}/.config/docker/ldc-alpine-nginx-pkgcache-0.1.0/workspace:/workspace \
        \
        --network=pkgnet \
        --name anginx-pkgcache-0.1.0-b4 \
      ewsdocker/ldc-alpine:nginx-pkgcache-0.1.0-b4

   </ul>
   </dd>
  </p>

<p>
 <dt>Docker Mount</dt>  
  <dd>
   This procedure uses the <i>mount</i> option of the <i>docker run</i> command 
   to map a <i>Docker Volume</i> on the <i>Docker Host</i> to the 
   <i>ldc-alpine:nginx-pkgcache Nginx</i> html folder.  
   It requires creation of a <i>Docker Volume</i>, which adds to the complexity.
   However, the benefit is that it is a <i>Docker</i> volume and 
   not a <i>user's</i> folder;
  </dd>

</p>

<ul>

<p>
 <u>An Example</u>
  <dd>
   <p>
   This procedure uses the <i>mount</i> option to mount a 
   <b>Docker</b> volume to be used for the <i>Nginx</i> html folder.  
   <ul>
   <li>Check for existence of the <b>nginx-html</b> volume:</li>  
    
    docker volume inspect nginx-html
    
   <li>If the response is <b>Error: No such volume: nginx-html</b>, 
   create the volume:</li>

    docker volume create nginx-html  

  </ul>
 </p>
 
 <p>
  HTML data (Web Pages) to be served should be added to the <i>nginx-html</i>
  volume, starting in the /, or root, directory.  
 </p>

 <p>
  Execute the following <i>docker run</i> command to download the image, create a 
  service container and start the service on port 80:
 </p>

    docker run \
        -d \
        --restart unless-stopped \
        \
        -e LMS_BASE="${HOME}/.local" \
        -e LMS_HOME="${HOME}" \
        -e LMS_CONF="${HOME}/.config" \
        \
        -v /etc/localtime:/etc/localtime:ro \
        \
        --mount source=nginx-html,target=/usr/share/nginx/html \
        \
        -v ${HOME}/bin:/userbin \
        -v ${HOME}/.local:/usrlocal \
        -v ${HOME}/.config/docker:/conf \
        -v ${HOME}/.config/docker/ldc-alpine-nginx-pkgcache-0.1.0:${HOME} \
        -v ${HOME}/.config/docker/ldc-alpine-nginx-pkgcache-0.1.0/workspace:/workspace \
        \
        --network=pkgnet \
        \
        --name anginx-pkgcache-0.1.0-b4 \
      ewsdocker/ldc-alpine:nginx-pkgcache-0.1.0-b4

  </dd>

 </ul>

</dl>

<hr />

<p>
 <b>
  Copyright © 2018-2020. EarthWalk Software.<br \>  
  Licensed under the GNU General Public License, GPL-3.0-or-later.<br />  
 </b>
</p>
<p>
 This file is part of <b>ewsdocker/ldc-alpine:nginx-pkgcache</b>.
</p>  

<p>
 <b>ewsdocker/ldc-alpine:nginx-pkgcache</b> is free software: you can redistribute 
 it and/or modify it under the terms of the GNU General Public License 
 as published by the Free Software Foundation, either version 3 of the 
 License, or (at your option) any later version.  
</p>

<p>
 <b>ewsdocker/ldc-alpine:nginx-pkgcache</b> is distributed in the hope that it will 
 be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
 of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.  
</p>

<p>
 You should have received a copy of the GNU General Public License
 along with <b>ewsdocker/ldc-alpine:nginx-pkgcache</b>.  If not, see 
 <a href="http://www.gnu.org/licenses/">GNU Licenses</a>.  
</p>

<hr \>

 <p>
 Portions of <b>ewsdocker/ldc-alpine:nginx-pkgcache</b> are controlled or licensed by
 </p>
 
 <p>
 <b>
 NGINX<br />
 Copyright (C) 2011-2016 Nginx, Inc.<br />  
 All rights reserved.<br />  
 </b>
</p>

<p>
 Redistribution and use in source and binary forms, with or without modification, are  permitted provided that the following conditions are met:  
</p>

<p>
<ol>
<li> Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.  
</li>

<li> Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.  
</li>
</ol>
<p>
 THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND ANY EXPRESS OR  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTA BILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.  
</p>
<hr />

