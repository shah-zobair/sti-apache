FROM rhel7.2
RUN yum update -y && \
    yum install -y httpd
USER apache
ONBUILD COPY index.html /var/www/html/
CMD ["httpd", "-D", "FOREGROUND"]
