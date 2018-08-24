Hi!

We built this challenge to get to know you better by understanding your thought processes and methodologies.

## Description

This challenge is divided into 2 non-sequential parts, ***Planning*** and ***Execution***.

Both parts will include detailed instructions on what to do and how to do it.

#### Guidelines
* ***Fork this _git repo_*** and add all your answers and relevant files.
* Make sure you ***document everything*** and assume nothing.
* ***Send us a link to your fork*** as soon as you start working on it, and then let us know when you're done.
* If you can't finish the challenge due to unforeseen personal reasons let us know ASAP so we can adapt your deadline and/or challenge.
* Any challenge related questions, technical or otherwise, feel free to contact us: ```devops (at) unbabel.com```

#### What will we look at
Although we keep processes transparent and straightforward, if we were to provide you with specific answers to this question you'd be come instantly biased by your interpretation of what we may or may not want.

For now let's just say we are super curious about the way people tackle different problems and as we're also open-minded about it. We'll accept anything and look at everything, as long as it makes sense.

After you've submitted your answers we'll review them and discuss in detail our conclusions.

### Context

We're building ***MultiVAC***, a multi-purpose, self-adjusting and self-correcting computer that will help us understand how to reverse the universe's entropy.

Of course, we're at the very early stages, and as such, we're starting with the bare minimum. Our MultiVAC is currently in the form of a single application that uses a ***web api*** through ***http*** with a limited number of ***endpoints***.

There are several actions MultiVAC can perform, and answer only one question.

```
Question:
* How can the entropy of the universe be reveserd?
```

```
Actions:
* Acquire more data.
* Process data.
```

***App Architecture***

```
* Flask Server
* Worker Machines
* Redis Server
* MongoDB
```

***Endpoint mapping***

1) Question

```
GET /multivac
```

2) Acquire more data

```
POST /multivac/data
```

Body parameters (form):
```
data: String
```


### Testing MultiVAC

To run MultiVAC do:

```

python manage.py runserver
python manage.py worker


```

Multivac needs to learn until it provides a meaningful answer to our question.

To test it do as follows:

* Invoke the ``` GET /multivac``` endpoint and check if MultiVAC is able to answer
* If MultiVAC is not giving you a proper answer, you need to feed it with more data and make it process it.
* To feed data into MultiVAC invoke ```POST /multivac/data``` and pass data to answer the question.
* While MultiVAC processes data asynchronously, try to keep questioning it a couple of times to see if it can answer back. If not, repeat the whole process and feed more data into it.


## Planning

Describe the deployment architecture and how you would implement it. Please mention what measure would you take for.

* Security
* Scalability
* Logging
* Monitoring
* Automation

## Execution

For this part you may need to have access to a Kubernetes cluster or a cloud instance. Create one using the [GCP free tier](https://cloud.google.com/free/) to spin up your testing environment, but if you need extra resources please contact us so that we can set them up for you.

### 2.1 Deployment
Write the necessary scripts for the deployment of this application. Note this can be a single machine deployment, so no concerns with scalability are necessary. You should be using Docker and Kubernetes. If you have no experience with these tools but have experience with equivalent ones, please use the ones you are already familiar with.

### 2.2 Continous Integration
Set up a continuous integration system that runs the project tests after each commit. We recommend using the GitLab CI system for this purpose, but you are welcome to implement it using other tools.

### 2.3 Debuging
Endpoint /zzz/ has a bug. Tell us exactly what the problem is, and for extra credit try to fix it.
