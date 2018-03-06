FROM wordpress:php7.2-fpm-alpine

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp

RUN apk update
RUN apk add msmtp

ADD entrypoint.patch ./

ADD msmtprc /etc/msmtprc

RUN patch /usr/local/bin/docker-entrypoint.sh entrypoint.patch && rm entrypoint.patch
