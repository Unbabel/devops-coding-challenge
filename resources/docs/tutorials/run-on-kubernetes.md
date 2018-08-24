[WIP]
TODOLIST:
* Explain what is Storage Class. Stateful vs Stateless
  - Use defaut
  - Claim REF: https://cloud.google.com/kubernetes-engine/docs/concepts/persistent-volumes

Explain each one manifest

Apply Manifests
```
kubectl create secret generic multivac-secret --from-literal=password="isaacasimov" --from-literal=secret-key="foundation" 

kubectl apply -f bundle.yaml
```

Next steps
* Redis + SSL https://redislabs.com/blog/stunnel-secure-redis-ssl/
* Vault as the Secret manager

```
# DNS-based service discovery 
kubectl run busybox --image=radial/busyboxplus:curl -i --tty

REDIS_IP=$(kubectl get svc multivac-redis -o jsonpath='{.spec.clusterIP}')
REDIS_PORT=$(kubectl get svc multivac-redis -o jsonpath='{.spec.ports[0].port}')

echo $REDIS_IP && echo $REDIS_PORT
10.23.246.10
6379


 curl 10.23.249.148:5000

  kubectl exec -i multivac-web-server-7fff6fd78f-p6qmx  -- cat /etc/multivac/settings.toml

```

> https://cloud.google.com/community/tutorials/envoy-flask-google-container-engine

> Mongo Tutorial https://lakshminp.com/docker-mongodb 

> Mongo reference: https://github.com/docker-library/mongo/tree/master/4.0

> Redis Related issue: https://github.com/docker-library/redis/issues/46
