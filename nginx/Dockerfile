FROM nginx:alpine

RUN adduser -D -s /bin/sh -u 1000 dockeruser \
 && sed -i 's/user\ \ nginx\;/user\ \ dockeruser\;/g' /etc/nginx/nginx.conf
ADD server.conf /etc/nginx/conf.d/default.conf

# install sudo and set dockeruser sudoer
RUN apk --update add sudo \
 && echo 'dockeruser ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers

WORKDIR /etc/nginx
USER dockeruser
ENTRYPOINT ["sudo", "nginx", "-g", "daemon off;"]