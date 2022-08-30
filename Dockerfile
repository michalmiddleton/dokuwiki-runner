FROM alpine:3.16

RUN apk add --no-cache apache2 php8-apache2 php8 php8-gd php8-session php8-calendar \
	php8-ctype php8-dom php8-exif php8-fileinfo php8-gettext php8-json \
	php8-iconv php8-xml php8-xmlreader php8-openssl curl;\
	rm -f /etc/apache2/conf.d/userdir.conf

COPY httpd-foreground /usr/local/bin/

HEALTHCHECK --interval=30s --timeout=2s \
  CMD curl -f http://localhost/ || exit 1

EXPOSE 80
CMD ["httpd-foreground"]
