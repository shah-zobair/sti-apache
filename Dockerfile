FROM registry.access.redhat.com/rhel7.2:latest
RUN yum update -y && \
    yum install -y httpd mod_rewrite php* mod_ssl && yum clean all

RUN sed -i 's/Listen 80/Listen 8080/g' /etc/httpd/conf/httpd.conf && sed -i 's/Listen 443/Listen 8443/g' /etc/httpd/conf.d/ssl.conf && sed -i 's/VirtualHost _default_:443/VirtualHost _default_:8443/g' /etc/httpd/conf.d/ssl.conf

USER 48
#USER apache
EXPOSE 8080

#ONBUILD COPY index.html /var/www/html/
COPY index.html /var/www/html/

CMD ["httpd", "-D", "FOREGROUND"]
