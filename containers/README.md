## Just a simple MVP with docker-compose

#### MVP (minimum viable product)
* This is non scalable simple local solution to test the code execution.
* To scale the workers we just need to add more builds
  * Define that on compose
  * Create builds with different ports since we are running local

#### Folder structure

```
├── README.md
├── docker-compose.yml
├── mongodb
│   └── Dockerfile
├── redis
├── server
│   ├── Dockerfile
│   └── build_server.sh
└── worker
    ├── Dockerfile
    └── build_worker.sh
```

#### Execution

* We need to do the build of the docker images on each respective folder
```
$ docker build -t multivac_server:v1 .
```
  * The name of the images builted must be according to the compose definition.

* On the folder run
```
$ docker-compose up -d
```

* To see the containers
```
$ docker-compose ps
```

* To see the logs
```
docker-compose logs
```

* To test we can go to the browser or in shell:
```
wget --post-data="data=ExampleData" http://0.0.0.0:5000/multivac/data
```


#### TODO LIST
* Mongo db is stateless, so we need to add a volume.
*
