FROM debian:latest
MAINTAINER weirich@elexis.ch
LABEL description="A minimal git server"
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install git apache2 nano
COPY apache2.conf /etc/apache2/apache2.conf
COPY 001-gitweb.conf /etc/apache2/sites-available/001-gitweb.conf
COPY gitweb /var/www/gitweb/
RUN ln /etc/apache2/sites-available/001-gitweb.conf /etc/apache2/sites-enabled/001-gitweb.conf
RUN mkdir /opt/git
RUN a2enmod cgi alias env
RUN rm /etc/apache2/sites-enabled/000-default.conf
EXPOSE 80
