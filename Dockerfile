FROM python:3.11-alpine

COPY requirements.txt /
RUN pip install -r /requirements.txt \
    && mkdir /app \
    && apk add apache2 apache2-mod-wsgi

COPY httpd.conf /etc/apache2/httpd.conf

COPY scraper /app
WORKDIR /app

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND", "-f", "/etc/apache2/httpd.conf"]
