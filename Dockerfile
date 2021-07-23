FROM node:14-alpine3.12 as  builder

COPY src/package.json package.json

RUN npm i

FROM nginx:1.21.1-alpine

LABEL maintainer="Convergence Labs, Inc."

# confd
RUN wget https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 && \
    mv confd-0.16.0-linux-amd64 /usr/local/bin/confd && \
    chmod +x /usr/local/bin/confd
COPY src/confd /etc/confd/

# nginx
COPY --from=builder node_modules/@convergence/admin-console/build /usr/share/nginx/html
COPY src/nginx/nginx.conf /etc/nginx/nginx.conf
COPY src/nginx/default.conf /etc/nginx/conf.d/nginx.conf

RUN chown -RL nginx:nginx /usr/share/nginx/ && \
    chown -RL nginx:nginx /var/cache/nginx/ && \
    mkdir /var/run/nginx && chown nginx:nginx /var/run/nginx

# boot script
COPY src/bin/boot.sh /boot.sh
RUN chmod +x /boot.sh

USER nginx

# start up
CMD ["/boot.sh"]