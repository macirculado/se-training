FROM centos:6
MAINTAINER macirculado

ARG GIT_TAG
RUN yum install -y httpd

COPY index.html /var/www/html/
COPY httpd.conf /etc/httpd/conf/
RUN sed -i "s/TAG/$GIT_TAG/g" /var/www/html/index.html

RUN chkconfig httpd on
EXPOSE 80

USER root
RUN mkdir -p /server/matchbox
RUN echo $GIT_TAG > /server/matchbox/test

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod +x /sbin/entrypoint.sh

CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]
#ENTRYPOINT ["/sbin/entrypoint.sh"]

