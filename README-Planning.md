
# Challenge Planning (draft)

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

### architecture

Just started my initial thoughts but regarding the deployment and architecture my initial vision is:


* In GCP setup a vm instance with gitlab server and runner
  - Setup docker to be able to do the image builds
  - Setup de gcloud sdk to be able to comunicate with kubernetes
* In GCP setup a Kubernetes cluster for the container orchestration where will the apps and services run

  #### terraform

  Terraform will be use to provision the cloud infrastructure

  #### ansible

  Ansible will be use to setup and configure the instance


### measures
* Security
  - bastion host
  - acess only from specific IP addresses
* Scalability
  -
* Logging
  -
* Monitoring
  -
* Automation
  - terraform for provisioning cloud infrastructure
    - gitlab server
    - gitlab runner
  - ansible for configuration management and software provisioning


### code-run
* At initial stages plan to run code simple on a OS
  * Run code just to test
  * Setup services
    * Mongo
    * Redis
    * API
* Later plan to create docker files with the code and services
* Then i hope to get the containers running on Kubernetes
