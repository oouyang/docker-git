11.7.2015: Version 2.0.0

Change server from Apache2 to Lighttpd

## A docker image with a simple git server over http

This is a quite simple Git-server for small workgroups. It is based on debian:latest and serves git repositories over http without encryption and without authentication for reading and simple password based authentication for writing.

I recommend to ise it on a local net or over VPN only. (Or modify it to your needs)

Start: `sudo docker run -d -p 8080:80 -v /path/to/git/repos:/opt/git rgwch/docker-git:2.0.0`

This will serve the git repositories at the host's `/path/to/git/repos`

### clone

     git clone http://<dockeraddress>:8080/git/<repository>

### Push

    git push
    
The server will ask for credentials. At startup, there ist access with username 'git' and password 'git'.
 
### gitweb

A simple web interface to view repositories. Navigate your browser to `http://<dockeraddress>:8080`


### modify settings

Run the container like this:

    docker run -it -p 8080:80 -v /path/to/git/repos:/opt/git bash
    
This way, you'll end up in a bash shell inside the container.

* remove users by removing the respective lines in /etc/lighttpd/.password
* add new user credentials like this: 

    /usr/sbin/addgituser.pl <name> <password> >/etc/lighttpd/.passwd
    

--------- Version 1.0.4 -------

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


