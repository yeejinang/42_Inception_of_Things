FROM ubuntu:18.04

RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /app/public /var/www/html
COPY index.html /app/public/index.html.template

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 80

CMD ["/start.sh"]