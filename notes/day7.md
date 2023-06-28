# Traditional methodologies: Waterfall met.

# Agile met.

We deliver the product to out clients incrementaly

Day 1 ... we start the project
Day 20, first installation in the production environment. 100% functional installation
                                                          5% of the functionality
    Test?   5%
                                                          
Day 40, second installation in the production environment. 100% functional installation
                                                          +10% of the functionality
    Test?   +10    (5%)
Day 60, second installation in the production environment. 100% functional installation
                                                          +5% of the functionality
    Test?   +5    (15%)
Day 80, second installation in the production environment. 100% functional installation
                                                          +15% of the functionality
Day 100, second installation in the production environment. 100% functional installation
                                                          +5% of the functionality
They allow us to have feedback timely.... and more improvement...
But these methodologies came with their own new PPROBLEMS.

With trad metho...how many times I had to do testing? ONCE... when the software (the whole system) was developed
I'm going to have much way more testing than before...

How many installations do I have to do nowadays? A bunch of them

I mean... that costs maney.... a bunch of money
NO... I have not enough money nor resources... nor time

There is JUST 1 solution for this new problem: AUTOMATION

# DEV-->OPS

Is a culture... it is a movement in favor of AUTOMATION
We want to AUTOMATE... what? Everything
    
            AUTOMATE?
PLAN            x
CODE            ~
BUILD           √       NPM YARN WEBPACK          MAVEN, GRADLE        MSBUILD DOTNET NUGET
------> Agile development
TEST
    definition  x
    execution   √       Mocha.js Cucumber cypress selenium webdriver.io
------> Countinuous integration
RELEASE
    Is the process of put our distributable (artifact) in our customer hands             √    container image        << Docker
------> Countinouos delivery
DEPLOY
    Install that artifact in a production environment                                    √.   kubernetes
------> Continuous deployment
OPERATION                                                                                √    kubernetes
MONITOR                                                                                  √    kubernetes (ELK) (Prometheus+Grafana)


Automation Servers: Orchestrate all those automations.
    Jenkins, Azure Devops (TFS), TravisCI, Bamboo, TeamCity, Gitlab CI/CD / Github actions
    The allow us to define pipelines (scripts) to call all those automations

Mobile App
FrontEnd of an inhouse web app

## Continuous integration: CI

- Install Jenkins
- Install SonarQube

## Continuous Delivery.  \
## Continuous Deployment / CD

Sonarqube as a container (docker-compose.yaml)