FROM node:14-alpine3.12 as  builder

COPY src/package.json package.json

RUN npm i

FROM nginx:stable-alpine

# confd
RUN wget https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 && \
    mv confd-0.16.0-linux-amd64 /usr/local/bin/confd && \
    chmod +x /usr/local/bin/confd
ADD src/confd /etc/confd/

# nginx
COPY --from=builder node_modules/@convergence/admin-console/build /usr/share/nginx/html
COPY src/nginx/default.conf /etc/nginx/conf.d/default.conf

# boot script
ADD src/bin/boot.sh /boot.sh
RUN chmod +x /boot.sh

# start up
CMD ["/boot.sh"]