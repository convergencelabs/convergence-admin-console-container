FROM nginx:stable-alpine

# confd
RUN wget https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 && \
    mv confd-0.16.0-linux-amd64 /usr/local/bin/confd && \
    chmod +x /usr/local/bin/confd
ADD confd /etc/confd/

# nginx
COPY www /usr/share/nginx/html
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# boot script
ADD bin/boot.sh /boot.sh
RUN chmod +x /boot.sh

# start up
CMD ["/boot.sh"]