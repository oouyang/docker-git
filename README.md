# docker-git
a docker image with a simple git server

This is a quite simple Git-server for small workgroups. It is based on debian:latest and serves git repositories over http without encryption and without authentication.
Use it on a local net or over VPN. (Or modify it to your needs)

Start: `sudo docker run -t -i -p 8080:80 rgwch/git-server:<tag> bash`

    cd /opt/git
    git clone --bare <existing repo>
    service apache2 start

Use it from remote with git:

    git clone http://<address>:8080/git/<repository>

or via the gitweb interface

    http://<address>:8080


or create it yourself with this Dockerfile:

    sudo docker build -t <group>/git-server:<tag> .
    
