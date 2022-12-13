FROM nginx:1.20-alpine

ADD conf/nginx.conf /etc/nginx/nginx.conf

ADD script/entrypoint.sh /entrypoint.sh
ADD script/le.sh /le.sh

EXPOSE 80
EXPOSE 443

RUN \
 rm /etc/nginx/conf.d/default.conf && \
 chmod +x /entrypoint.sh && \
 chmod +x /le.sh && \
 apk add --no-cache --update certbot tzdata openssl supervisor

CMD ["/entrypoint.sh"]
