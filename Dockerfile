FROM nginx
MAINTAINER Ando Roots <ando@sqroot.eu>

COPY nginx.conf /etc/nginx/nginx.conf
COPY _site /usr/share/nginx/html
