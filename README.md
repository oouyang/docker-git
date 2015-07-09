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


By default, it will serve the internal directory /opt/git, but you can easily have an existing repotisory root served;

    sudo docker run -t -i -p 8080:80 -v /srv/git:/opt/git rgwch/git-server:1.0.4 bash
    
This will serve your existing repositories at `/srv/git` via http on port 8080.

Running the server detached

    sudo docker run -d -p 8080:80 -v /srv/git:/opt/git rgwch/git-server:1.0.4 /usr/sbin/apachectl -D FOREGROUND
    
This will run the git server container in the background. find it with `sudo docker ps` and stop it with `sudo docker stop <id>`


