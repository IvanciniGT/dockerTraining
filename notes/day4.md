Why we don't want to set a bunch (2 is actually a bunch) of process within a container?
                                    ^
Containers are created from         |    Container Images...
That means... that in order to do that we should create a custom container image, with both apps installed.

Container Images are going to be distributed.... and are going to be used in production environments.
1 - I MariaBD gets crazy... I want to be able to access the wordpress container anyway
2 - We are going to install that in a producction environment
3 - What If I have to upgrade the DB... Do I need to stop the web server? REALLY? 

---

What are the main features that we find in a production environment that we
don't find in other environments (dev, test pre....) ?

- High Availability
    I'm gonna try to keep the system online certain amount of time... that we both have previously agreed

    Is it enough for you if I garantee that the system is going to be up and running at least 90% of 
    the time that it supposed to be working?
                
    90%         36 days/year        |   10 € / month
    99%         3.6 days/year       |   20 €€
    99.9%       8 hours/year        |   100 €€€€€€€
    99.99%      minutes/year        v   500 €€€€€€€€€€€€€€€€€€€€€€€

    REDUNDANCY

- Scalability

    When we can easily increase or decrease the resources (HW) depending on each moment needs

    App1: 
        Day 1:          100 users           NO SCALABILITY
        Day 100:        102 users
        Day 400:         98 users
    
    hospital: Internal management apps
    300 rooms
    100 doctors
    
    
    App2: 
        Day 1:          100 users           VERTICAL SCALABILITY: MORE MACHINE !
        Day 100:        10000 users
        Day 400:        100000 users
    
    App3:  That is the most common behaviour nowadays: INTERNET
        Hour 0:          0
        Hour 9:          0
        Hour 11:         10 users           HORIZONTAL SCAALABILITY: MORE MACHINES!
        Hour 14:         1000 users
        Hour 16:30:      25 users      
        Hours 19:00:     Rome against Inter de Milan  200000000 
    

    Wordpress       50
    MariaDB          6
    
    
---

YAML

Is a language to serialize data... such as: JSON, XML

But YAML is different.
It it widely used nowadays? 
- docker
- kubernetes
- ansible
- gitlab ci/cd
- ms azure devops
- ubuntu network configuration

---

Docker Swarm. It is the alternative from the people at Docker to work with containers in a production environment.
    Nobody uses Docker Swarm.... as everybody use Kubernetes
    
---

Docker client uses an imperative paradigmn
while Docker compose uses a Declarative Paradigm
    