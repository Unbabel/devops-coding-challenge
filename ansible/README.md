## Ansible


#### Purpose
* Configure the provisioned servers with the required configurations

#### Ansible folder structure

```
├── README.md
├── ansible.cfg
├── config
│   └── hosts
├── roles
│   ├── setup_docker
│   ├── setup_gitlab
│   ├── setup_runner
│   ├── setup_swarm_manager
│   └── setup_swarm_worker
├── setup_docker.yml
├── setup_gitlab.yml
├── setup_runner.yml
├── setup_swarm_manager.yml
└── setup_swarm_worker.yml
```

#### Configure inventory file with the output from the gitlab terraform
* Its required to configure the inventory file
* Only the gitlab-ci server has a static public ip
* The gitlab runner has a dynamic IP

```
vi config/hosts
```

#### Contents

* setup_docker.yml - setup up docker on both servers
* setup_gitlab.yml - setup up docker and gitlab server
* setup_runner.yml - setup docker and gitlab runner

#### Execute the playbook
* Example: ```$ ansible-playbook -i config/hosts setup_docker.yml```
* Example: ```$ ansible-playbook -i config/hosts setup_docker.yml --limit docker-swarm```
