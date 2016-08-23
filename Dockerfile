FROM registry.access.redhat.com/rhel7:latest
RUN yum update -y && \
    yum install -y httpd
USER apache
ONBUILD COPY index.html /var/www/html/
CMD ["httpd", "-D", "FOREGROUND"]
