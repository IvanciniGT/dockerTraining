# Containers file systems

A container is created from a container image

A container image is just a tar file

Inside that file we have a posix compatible folder structure.

Whenever a container image is pull that tar file (the image) is decompressed:


MY HOST FILESYSTEM
/
    bin/
        ls
        cat
        cd
        apt
        bash
    etc/
    opt/
    var/
        lib/
            docker/
                    containers/
                            mynginx/
                                    etc/
                                        nginx/
                                              ngincx.conf (version 2) 
                            mynginx2/
                                    etc/
                                        nginx/
                                              ngincx.conf  (version 3) 
                            mymariadb/
                                    var/
                                        lib/
                                            mariadb/
                                                    mydbfiles.whatever
                    images/
                            nginx:latest/   < ------            /bin/bash       chroot
                                            bin/
                                                ls
                                                cat
                                                cd
                                                apt
                                                bash
                                            etc/
                                                nginx/
                                                        nginx.conf (original version)
                                            opt/
                                                nginx/
                                                        nginx
                                            var/
                                                nginx/
                                                                    
                                            tmp/
                                            root/
                                            home/
    tmp/
    root/
    home/

A container FS is the combination of MULTIPLE LAYERS that are stack

VOLUME: 
                                                                            var/
                                                                                mariadb/ ---> /home/myuser/mariadbdata (HOST)
                                                                                

CONTAINER LAYER: LAYER 1
                                            etc/
                                                nginx/
                                                      nginx.conf
BASE LAYER: LAYER 0: IMAGE LAYER
    
                                    bin/    etc/                    opt/    var/
                                                nginx/
                                                      nginx.conf 
                                                      
The base layer is inmutable... 
We can not change or add or delete nothing at all in that layer
Every single update (modification) that is done in the Container FS is stored in the container LAYER


Whenever we remove a container the container layer is removed

If the container layer (folder) is removed whenever the container is removed...
What happens with my custom data (information)? It is deleted too.

Is that a drama??? Not really or yes

Imagine you create a VM. And you install a database inside the VM .
And you remove your VM... What happens with your data? It is deleted too.

VMs are meant to be there for a while? YES
And... if I have to upgrade the OS of the VM or its DATABASE 

    VM1: Windows 11
         Mysql 5.7.2
            Database 

But we don't play with containers in that way... Containers are not meant for that

    C1: Mysql 5.7.1    ---> REMOVED
            Database /var/mariadb/myDB                                          myDB
                     /var/mariadb/          ----> HOST: /home/myuser/maridbdata/
            
    C2: Mysql 5.7.2
            Database /var/mariadb/myDB                                          myDB
                     /var/mariadb/          ----> HOST: /home/myuser/maridbdata/

---

# Environment vars

Are environment vars relevant in containers?
like... are they important in the containers world? YES

why?
I told you that containers are created from container images.
Also that a container image comes with an app already installed and configured.

And... call me crazy... the actual configuration that is specified in the images is gonna be good for me? USUALLY NEVER

mariadb image.
I want to have a DB there
And I want to have my custom USER & PASSWORD

Somehow I should be able to specify that info.

Developers who develop apps for (that are going to be shipped as container images) 
needs to take that into consideration. And the have to provide final clients (users) of
theirs apps with an easy mechanism to configure & customize the behaviour of the app inside that image.

Env vars is the way to go.

---

Wordpress

- Web server: Apache | nginx
- PHP 
- MySQL or MariaDB

Wordpress > MariaDB
Wordpress must be exposed on the host public ip on port 8080
For sure... I want to be able to keep both:
- the database info
- the wordpress info