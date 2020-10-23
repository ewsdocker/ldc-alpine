
__Preliminary Documentation__ - 2020-10-19
____  
<b>ewsdocker/ldc-alpine:anginx</b>  

<p>
  An un-modified Nginx HTTPD server image in an Alpine Linux container. 
</p>

<hr />  

<p>
  Visit the 
  <a href="https://github.com/ewsdocker/ldc-alpine/anginx/wiki">
    ewsdocker/ldc-alpine:anginx
  </a> 
  Wiki for complete documentation.  
</p>  

<hr />  

<p>
 The <i>ldc-alpine:anginx</i> docker image is based on the latest 
 <i>NGINX</i> mainline version in an  <i>Alpine Linux Docker</i> image.  

 <ul>
  <li>A pre-built <i>ldc-alpine:anginx Docker</i> image is available on 
   <a href="https://hub.docker.com">Docker Hub</a> at 
   <a href="https://hub.docker.com/r/ewsdocker/alpine-nginx/">
      ewsdocker/alpine-nginx
   </a>;
  </li>
  <li>The source for 
   <i>ewsdocker/alpine-nginx</i> is available on 
   <a href="https://github.com/">GitHub</a> at 
   <a href="https://github.com/ewsdocker/alpine-nginx">
      ewsdocker/alpine-nginx.  
   </a>.
  </li>
 </ul>
</p>

<hr />

<p>
 The <i>ewsdocker/ldc-alpine:nginx</i> docker image is <b>NOT</b> an
 official release of <i>Nginx</i>.  
 <ul> 
  <li>
   The official release of Nginx is available on 
   <a href="https://github.com/">GitHub</a> 
   from 
   <a href="https://github.com/nginxinc">Nginx, Inc.</a>;  
  </li>
  <li>
   The official build of <i>Nginx</i> is available on 
   <a href="https://hub.docker.com">Docker Hub</a> 
   at 
   <a href="https://hub.docker.com/_/nginx/">NGINX, Inc.</a>.
  </li>
 </ul>
</p>

<hr />

<b>Installing ewsdocker/ldc-alpine:nginx</b>

<p>
 Below are presented two examples of the many ways to download, create and start 
 the service container.  Both examples have strengths and weaknesses.  
 <dl>
  <dt>Docker Volume</dt>
   <dd>  
    This is the easiest procedure to understand.  It uses the _volume_ option 
    to map the <i>Nginx</i> html folder in the <i>ldc-alpine:nginx</i> container 
    to a <i>Docker host</i> folder (in the calling user's home folder) 
    to be used for the <i>NGINX</i> html folder.  
   </dd>
  <br />
  <dt>Docker Mount</dt>  
   <dd>
    This procedure uses the <i>mount</i> option of the <i>docker run</i> command 
    to map a <b>Docker Volume</b> on the <b>Docker Host</b> to the 
    <b>alpine-nginx</b> <i>Nginx</i> html folder.  
    It requires creation of a <b>Docker Volume</b>, which adds to the complexity.
    However, the benefit is that it is a <b>Docker</b> volume and 
    not a <i>user's</i> folder;
   </dd>
 </dl>
</p>

<p>
 In both approaches, the image will be 
 <ul>
  <li>pulled from Docker Hub (if it is not already present),</li>
  <li>built into a web service container (if it is not already created), and </li>
  <li>started on <b>port 80</b>.</li>  
 </ul>
</p>

<hr />

<dl>
 <dt><b>Docker Volume.</b></dt>
  <dd>
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

    docker run -d \
               --restart unless-stopped \
               -v ${HOME}/.local/shared/nginx-html:/usr/share/nginx/html \
               -p 80:80 \
               --name=alpine-nginx-3.10.0 \
           ewsdocker/ldc-alpine:nginx-0.1.0-b4  

  </dd>

 <hr />  

 <dt><b>Docker Mount.</b></dt>
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
   
   HTML data (Web Pages) to be served should be added to the <i>nginx-html</i>
   volume, starting in the /, or root, directory.  
  </p>

  <p>
   Execute the following <i>docker run</i> command to download the image, create a 
   service container and start the service on port 80:
  </p>

    docker run -d \
               --restart unless-stopped \
               --mount source=nginx-html,target=/usr/share/nginx/html \
               -p 80:80 \
               --name=alpine-nginx-3.10.0 \
           ewsdocker/ldc-alpine:nginx-0.1.0-b4  

  </dd>
</dl>

<hr />
  
**Copyright © 2016-2020. EarthWalk Software.**  
**Licensed under the GNU General Public License, GPL-3.0-or-later.**  

This file is part of **ewsdocker/alpine-nginx-pkgcache**.  

**ewsdocker/alpine-nginx-pkgcache** is free software: you can redistribute 
it and/or modify it under the terms of the GNU General Public License 
as published by the Free Software Foundation, either version 3 of the 
License, or (at your option) any later version.  

**ewsdocker/alpine-nginx-pkgcache** is distributed in the hope that it will 
be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.  

You should have received a copy of the GNU General Public License
along with **ewsdocker/alpine-nginx-pkgcache**.  If not, see 
<http://www.gnu.org/licenses/>.  

____  

**NGINX**  
**Copyright (C) 2011-2016 Nginx, Inc.**  
**All rights reserved.**  

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:  

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.  

1. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.  

THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.  

