FROM registry.access.redhat.com/rhel7.2:latest
RUN yum update -y && \
    yum install -y httpd
USER 0
EXPOSE 80
ONBUILD COPY index.html /var/www/html/
CMD ["httpd", "-D", "FOREGROUND"]
