FROM nginx
MAINTAINER Ando Roots <ando@sqroot.eu>
EXPOSE 8080

RUN chmod -R 777 /var/log/nginx /var/cache/nginx /var/run && \
    rm -rf /etc/nginx/conf.d/ && \
    chmod -R 775 /etc/nginx/

COPY nginx.conf /etc/nginx/nginx.conf
COPY _site /usr/share/nginx/html
