## Running MultiVAC locally

The MultiVAC is designed to run into containers, however you can run it on your local environment.

This tutorial is intended to help you to understand the needed steps to setting up and run the MultiVAC.

> **Note**: As you are using our local machine, you should be comfortable to work using multiple terminals.


### Envoirment

This tutorial was tested on an **Ubuntu 18.04** machine.

If you have other environment, the scripts should not work but you will find links to official documentation.

### Dev Requirements

Install from docs:

* [Python 3.6](https://docs.python.org/3.6/)
* [Pip](https://pypi.org/project/pip/)
* [Pipenv](https://github.com/pypa/pipenv)


Install from [script](../../scripts/install_dev_requirements.sh):

```bash
# Get MultiVAC:
git clone https://github.com/arthur0/devops-coding-challenge.git

# Using the solution branch
git checkout solution

# Install dev requirements
cd devops-coding-challenge/scripts
. install_dev_requirements.sh
```

### Setting up MongoDB

Install MongoDB from [script](../../scripts/install_mongo.sh):

```bash
. install_mongo.sh
```

> **Note**: [Installation docs](https://docs.mongodb.com/manual/installation/).


Configuring MongoDB according the MultiVAC envoirment:

```bash
# mongodb://multivac:isaacasimov@localhost:27017/multivac
sudo service mongod start

mongo --host 127.0.0.1:27017
# MongoDB outputs [...]

> use multivac
switched to db multivac
> db.createUser({user: "multivac", pwd: "isaacasimov", roles: ["readWrite", "dbAdmin"]})
Successfully added user: { "user" : "multivac", "roles" : [ "readWrite", "dbAdmin" ] }
```

### Setting up Redis

Install from  [script](../../scripts/install_redis.sh):

```bash
# It in another terminal:
. install_redis.sh
```

> **Note**: [Quickstart docs](https://redis.io/topics/quickstart).

To run the Redis server:
```bash
# Creating a config file
cat <<EOF >>redis.conf
maxmemory 20mb
maxmemory-policy allkeys-lru
maxmemory-samples 5
loglevel notice
logfile ""
requirepass isaacasimov
EOF

redis-server redis.conf
```

### Setting up MultiVAC

Running server:

```bash
# It in another terminal:

# Open the project folder
cd ../MultiVAC/

# Isolate the envoirment
pipenv shell

# Install dependencies
pipenv install

# Help message
python manage.py
usage: manage.py [-?] {worker,list_routes,test,runserver,shell} ...

positional arguments:
  {worker,list_routes,test,runserver,shell}
    worker              Starts the worker loop
    list_routes         Display registered routes
    test                Run tests
    runserver           Runs the Flask development server i.e. app.run()
    shell               Runs a Python shell inside Flask application context.

optional arguments:
  -?, --help            show this help message and exit


# envoirment (development, production or testing)
export FLASK_ENV=testing

# settings from files. 
# NOTE: the values into .secrets.toml file are overrided by envoirment
export SETTINGS_MODULE_FOR_DYNACONF='settings.toml,.secrets.toml'

python manage.py runserver
```


Managing dependencies:

```bash
# Initialize shell in a virtual envoirment
pipenv shell
# Clean dependecies
pipenv clean
# Install a dev package
pipenv install --dev <package e.g. tox>
# Install dependencies from Pipfile
pipenv install
# Update dependencies into Pipfile
pipenv update
# Lock dependencies into Pipfile.lock and create requirements.txt
pipenv lock -r
```

> **Troubleshooting**: If the `pipenv` command does not work, try `source ~/.bash_profile`

### Testing MultiVAC
```bash
# It in another terminal:
curl http://127.0.0.1:5000/
Welcome to MultiVAC!

 curl \
    -X GET \
    http://127.0.0.1:5000/multivac
INSUFFICIENT DATA FOR MEANINGFUL ANSWER.

 curl \
    -X POST \
    -F "data=foo" \
    http://127.0.0.1:5000/multivac/data

 curl \
    -X GET \
    http://127.0.0.1:5000/multivac
foo
```
