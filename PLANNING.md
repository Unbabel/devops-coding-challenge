
## Challenge Planning and architecture

## Table of Contents

- [Repository Structure](#repo-structure)
- [Architecture](#architecture)
   * [Terraform](#terraform)
   * [Ansible](#ansible)
- [Measures](#measures)
- [Code runs ](#code-run)


<!-- toc -->


### repo-strucure

```
├── MultiVAC
│   └── multivac
├── ansible
│   └── gitlab
├── containers
└── terraform
    ├── gitlab
    ├── kubernetes
    ├── network
    └── registry
```

### Architecture

Just started my initial thoughts but regarding the deployment and architecture my initial vision is:

* Multi tier Architecture running inside Kubernetes
  * frontend
    * Server endpoints API
    * Load loadbalancer
    * message queue for decouple workers from Server
  * backend
    * Redis message queue
    * Mongo DB

* In GCP setup a vm instance with gitlab server and runner
  - Setup docker to be able to do the image builds.
  - Setup de gcloud sdk to be able to communicate with kubernetes

* In GCP setup a Kubernetes cluster for the container orchestration where will the apps and services run

### terraform
  Terraform will be use to provision the cloud infrastructure

### ansible
  Ansible will be use to setup and configure the instance


### Measures
* Security
  - Acess only from specific IP addresses
  - SSL in loadbalancer / external endpoints
* Scalability
  - Container orchestration in Kubernetes
  - Redis used as a message queue decouple server from workers
* Logging
  - Docker/Compose/Kubernetes logs
  - Redirect logs to a centralized service
    - ELK would be great.
* Monitoring
  - Prometheus
  - Integrated Monitoring provided by GCP
* Automation
  - terraform for provisioning cloud infrastructure
    - gitlab server
    - gitlab runner
    - kubernetes cluster
  - ansible for configuration management and software provisioning
    - setup gitlab
    - setup docker
    - possibly deployment


### code Execution
* At initial stages plan to run code simple on a OS
  * Run code just to test on docker / Compose
  * Setup services and dockerfiles
    * Mongo
    * Redis
    * Server
    * Workers
* Will need and ELB
* Later plan to create docker files with the code and services
* Then i hope to get the containers running on Kubernetes
