FROM debian:latest
MAINTAINER owen.ouyang@live.com
COPY runcontainer /usr/sbin/runcontainer
RUN apt-get -y update && apt-get -y install nano gitweb lighttpd 
ENV GIT_HTTP_EXPORT_ALL ""
RUN mkdir /opt/git
COPY config/gitweb.conf /etc/gitweb.conf
COPY addgituser.pl /usr/sbin/addgituser.pl
COPY config/lighttpd/ /etc/lighttpd
RUN chmod +x /usr/sbin/runcontainer && chmod +x /usr/sbin/addgituser.pl
EXPOSE 80
WORKDIR /etc/lighttpd
CMD ["/usr/sbin/runcontainer"]
