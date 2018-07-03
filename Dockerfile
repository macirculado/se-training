FROM centos:6
MAINTAINER macirculado

RUN yum install -y httpd

COPY index.html /var/www/html/
COPY httpd.conf /etc/httpd/conf/

RUN chkconfig httpd on

EXPOSE 80

CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]
