FROM alpine:3.18

RUN apk add --no-cache apache2 php81-apache2 php81 php81-gd php81-session php81-calendar \
	php81-ctype php81-dom php81-exif php81-fileinfo php81-gettext php81-json \
	php81-iconv php81-xml php81-xmlreader php81-openssl curl;\
	rm -f /etc/apache2/conf.d/userdir.conf

COPY httpd-foreground /usr/local/bin/

HEALTHCHECK --interval=30s --timeout=2s \
  CMD curl -f http://localhost/ || exit 1

EXPOSE 80
CMD ["httpd-foreground"]
