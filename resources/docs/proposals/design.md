Design Proposal

This document contains the design proposal for MultiVAC, based on the stack:  

```
* Flask Server: Web Server
* Redis Server: Cache
* MongoDB: Database
```

* [Flask](http://flask.pocoo.org/) is a microframework to develop Web servers in Python. 
    * Deploy as Kubernetes Deployment

* [MongoDB](https://github.com/mongodb/mongo) is a NoSQL document-oriented database.
    * Deployed as [Stateful Set](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/)

* Redis - (REmote DIrectory Server)is an (in-memory) key-value store.
    * [Introduction to Redis - In Memory Key Value Datastore](https://dzone.com/articleas/introduction-to-redis-in-memory-key-value-datastore)
    * [Using Redis as an LRU (Least Frequently Used) cache](https://redis.io/topics/lru-cache)
    * Deplyed as Kubernetes Deployment.


### Deployment

MultiVAC is developed using [Docker](https://docs.docker.com/develop/) contaneis and can deployed in a [Kubernetes cluster](../tutorials/run-on-kubernetes.md).

To run MultiVAC locally, was well modify/test the code, see this [doc](../tutorials/run-locally).


* Security
    * Secrets 
      * Add Redis password by adding [secrets](https://kubernetes.io/docs/tasks/inject-data-application/distribute-credentials-secure/)
    * Related [redis issue](https://github.com/docker-library/redis/issues/46)
    * [Next Steps] Vault
    * [Next Steps] Build own images based on onw registres
* Scalability
    * Scale Independently
```bash
$ kubectl scale deploy multivac-cache --replicas=4
deployment.extensions/multivac-cache scaled

$ kubectl get pods
NAME                              READY     STATUS    RESTARTS   AGE
multivac-cache-68bb4787cd-5qvx2   1/1       Running   0          12s
multivac-cache-68bb4787cd-fl4zz   1/1       Running   0          19h
multivac-cache-68bb4787cd-l2dsd   1/1       Running   0          12s
multivac-cache-68bb4787cd-r89nj   1/1       Running   0          12s
multivac-db-0                     1/1       Running   0          19h
multivac-server-7548df6db-2bbz8   1/1       Running   0          19h
```

* Logging
```bash
# Logs from Multivac App
kubectl logs -l app=multivac
# Logs from Redis
kubectl logs -l app=multivac,role=cache
# Logs from Mongo
kubectl logs -l app=multivac,role=db
```
* Monitoring
    * Google Cloud has default tools for monitoring
* Automation
    * Dynaconf on app
    * ConfigMaps
    * Manifests


Unorganized stuff  :shame:
> flask.ext is deprecated
https://github.com/pallets/flask/issues/1135

> Change flask_rq to flask_rq2
http://slides.skien.cc/flask-hacks-and-best-practices/
http://flask.pocoo.org/docs/1.0/extensiondev/

> https://github.com/rochacbruno/dynaconf

> https://netdevops.me/2017/flask-application-in-a-production-ready-container/

> TODO https://redislabs.com/blog/stunnel-secure-redis-ssl/

> Full redis.conf doc: https://raw.githubusercontent.com/antirez/redis/4.0/redis.conf

