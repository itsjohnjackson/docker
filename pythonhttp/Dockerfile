FROM nginx:stable
RUN apt-get update && apt-get install -y openssl apache2-utils python3 screen
RUN mkdir -p /etc/nginx/ssl && mkdir -p /srv/data && mkdir -p /etc/nginx/sites-available && mkdir -p /etc/nginx/sites-enabled

COPY default.conf /etc/nginx/conf.d/
COPY myapp /etc/nginx/sites-available/
COPY python-uploader.py /home/
COPY start.sh /
RUN chmod +x /start.sh
ENTRYPOINT [ "/start.sh" ]
