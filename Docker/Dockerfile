FROM nginx:latest

LABEL author="rajatz"

COPY index.html /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"] 


-----

FROM ubuntu:latest

RUN apt-get update && apt-get install -y apache2

COPY index.html /var/www/html/

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]

---
