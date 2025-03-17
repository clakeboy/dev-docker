FROM nginx:1.23.4-alpine
LABEL maintainer "clakeboy@gmail.com"

# COPY www.conf /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/
COPY nginx_log.sh /www/script/
RUN echo "0 0 * * * root /bin/sh /www/script/nginx_log.sh" >> /etc/crontab