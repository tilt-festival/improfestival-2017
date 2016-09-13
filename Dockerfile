FROM nginx
MAINTAINER Ando Roots <ando@sqroot.eu>

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/nginx.conf
COPY _site /usr/share/nginx/html
