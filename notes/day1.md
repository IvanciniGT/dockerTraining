# Software installation methods

## Classic installation

     App1  |  App2  | App3       
    ------------------------
       Operating System
    ------------------------
      Computer (hardware)
    
This installation method has several problems:
    - Compatibity? Maybe my app doesn't work on top of that OS
    - If I have a software installed... it's not easy to move that software to a new Computer!
    - What if App1 gets crazy. It has a bug.. and it gets the CPU to 100%
                                                              RAM
                                                              HDD
                                                              Networks
        In this scenario, the problem is not only that app1 gets offline
            App2, App3? they get offline too... ups !!!
                I mean... if that ahappens in my computer... 
                Well... the worst thing than can happen is that I may need to restart my laptop
                aybe I can lost like a couple of hours of work.
            What if this happens in a huge server? Where we have 200-20000 people connected... Men! Thats a problem !!!
    - All the apps share filesystem. The filesystem that the OS did create
      One app can access another app data
    - Or even... 1 app can access a part of the RAM memory where another app is storing its info....
        That's how a virus work!
      
## Virtual machines

     App1  |  App2  + App3       
    ------------------------
      OS1  |  OS2
    ------------------------
      VM1  |  VM2 (8Gbs + 2 cores)
    ------------------------
       hypervisor: VMWare, 
       Oracle Virtual Box, HyperV
    ------------------------
      Operating system
    ------------------------
      Computer (hardware)
        16Gbs of RAM
        8 cores
    
    This way of installing apps, solves a bunch of problems:
    - Compatibity? Maybe my app doesn't work on top of that OS
    - If I have a software installed... it's not easy to move that software to a new Computer!
    - What if App1 gets crazy. It has a bug.. and it gets the CPU to 100%
                                                              RAM
                                                              HDD
                                                              Networks
        In this scenario, the problem is not only that app1 gets offline
            App2, App3? they get offline too... ups !!!
                I mean... if that ahappens in my computer... 
                Well... the worst thing than can happen is that I may need to restart my laptop
                aybe I can lost like a couple of hours of work.
            What if this happens in a huge server? Where we have 200-20000 people connected... Men! Thats a problem !!!
    - All the apps share filesystem. The filesystem that the OS did create
      One app can access another app data
    - Or even... 1 app can access a part of the RAM memory where another app is storing its info....
        That's how a virus work!
    And that's why we have been using VM in production environments for almost 3 decades

    
    But... VMs are not that pretty... they have their own problems:
    - Installation/Configuration of the whole env is more complex
    - The maintenance... is harder
    - Apps run slower compared to a classical installation
    - I'm wasting hardware resources

## Containers

     App1  |  App2  + App3       
    ------------------------
      C1   |  C2 (8Gbs + 2 cores)
    ------------------------
       container manager: 
       docker, podma, crio, containerd
    ------------------------
      Operating system (Linux)
    ------------------------
      Computer (hardware)
        16Gbs of RAM
        8 cores

# Container?

An isolated environment where we can run process controlled by a Linux kernel, the linux kernel that we have installed and running in the host.
When we say isolated:
- A container has its own network configuration
- A container has its own system environment variables
- A container has its own FileSystem
- A container may have limits in the hardware usage

I cannot install an os inside a container... that is not posible.

## But then... do you mean that I cannot create a container in Windows? NO we cannot

What we can do is to use a Windows Feature... We have that from windows 10 which is called wls2
Which allows to execute a second OS kernel in parallel with the Windows Kernel...
We can run a Linux kernel in windows natively nowadays

Containers are created from Container Images.

# Container image

Imagine this...
I want to install a software: Kafka, rabbitmq, mysql, ms sql server.

0º Install And configure pre-requisites
1º Download the installer
2º Execute the installer... and configure a bunch of things..
    We need a minimum (or not that minimum) knowledge of SQL Server to install it 
3º I need to operate that installation:
    - Start
    - Stop
    - Restart
    - Check the logs of the database
    

Imagine I zip the installation foolder (c:\Program files\SQL Server) -> .zip  -> email
That zip file is a container image actually.

A Container image is a compressed file (tar) containing:
- A folder structure compatible with POSIX

    /
        boot/ 
        bin/  
            ls
            cd
            mkdir
            rm
            sh
            bash
            cat
            chmod
            chown
            ...
        etc/
            nginx/
                    nginx.conf
        home/ 
        root/ 
        var/ 
            lib/
                html/
            lib/
            logs/
                nginx/
                      nginx.log
        opt/  
            nginx/
                    nginx
        usr/
        media/
        dev/
        tmp/  

That tar file comes with some extra metadata:
    - Container image name
    - Default ports that the apps installed inside tend to open: 80
    - The most relevant folders where the apps installed tend to store their info
        var/lib/html/
        var/logs/nginx
    - Custom env variables 
    
Container images are distribute thru Container Images Repository Registries.
The most famous and used one is called:
- docker hub
- quay.io       REDHAT registry
- Companies tend to create(host) their own images: artifactory or nexus
- Github or gitlab allows to act as registries.
                
Nowadays EVERY SINGLE software is distribuited thru container images...

Like an image of an overall app


# Docker?

Is a tool (software) to manage containers.... for sure not the only one.


---

# OS

Is a set of pieces of software.
Kernel - Which is the program that controls hw and the processes using that hardware
        Microsoft had 2 different kernels in its history:
            - MsDOS
            - NT Kernel... NewTechnology of Microsoft
                - Windows NT, XP, Server, Windows 7, 8, 10, 11
Shells - Which allos us(humans) top interact with the kernel
    Cli shells: Where we can interact with the kernel by using commands: TERMINAL
        CommandLineInterpreter
        - cmd 
        - powershell
    GUI shells: Fluent Design > Metro
Webbrowser
Text editor
Games
Libraries to build new software
A software to control the process that run in the computer: TAsk Administrator
Graphical file explorer

# Linux?

It is not an OS.
It is an OS Kernel.
Actually our friend Linus Torvalds, who was the developer of Linux (Linus' Unix)
started to work with a group of people (GNU) who where trying to develop their own OS
but they couldn't... They had almost everything needed for a complety OS... but one piece.... 

75%.  25%
GNU/Linux OS:
- Debian
- Ubuntu
- Redhat Enterprise Linux
- Fedora
- Suse
Android
- Linux Kernel
- With google libs

Actually... Which is the most user OS Kernel in the world? Linux
There is an OS, that on its own makes Linux the most used OS Kernel ever? 

# UNIX 

Is it an OS? No it's not.
It was OS... time ago. It quit in 2002.

Nowadays UNIX is an specification (actually not 1 but 2) about how to create an OS.

2 specs:
- POSIX
- SUS

There are companies that create their OWN OS... Actually most BIG HArdware manufacters develop their own OS.
- IBM       AIX -> UNIX® 
- HP        HP-UX -> UNIX®
- Oracle    SOLARIS -> UNIX®
    Sun microsystems <- JAVA
- Apple     MacOS -> UNIX®

Berkley University of California: BSD 

UNIX was create by Bell labs -> AT&T

# Linux + GNU (GNU is Not Unix)

GNU/Linux is an OS that we think that was created accorgin to thos spect too... We don't actually know that
As Linux was neved evaluated in that way... That costs money

# POSIX 

/
    boot/       OS Loader
    bin/        commands
    etc/        stores settings
    home/       users folder
    root/       root user folder
    var/        Stores persisten data from apps
    opt/        Where we install apps    
    usr/
    media/
    dev/
    tmp/        Temporary folder... which is automatically deleted each time a computer is restarted