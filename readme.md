## Installation:  
check http://doc.e-is.pro/cesium-plus-pod/install.html for elasticsearch.yml config file setting.  

Hereunder my draft temporary own settings :

```
cluster.name: cesium-plus-pod-g1
cluster.remote.host: cplus.g1.pfouque.xyz
cluster.remote.port: 9200
cluster.remote.useSsl: true
node.name: cesium-plus-pod-g1-node-1
network.host: 0.0.0.0
http.port: 9200
http.cors.allow-origin: "/.*/"
http.cors.enabled: true
security.manager.enabled: false
duniter.blockchain.enable: true
duniter.host: g1.duniter.org
duniter.port: 10901
duniter.security.enable: true
duniter.p2p.includes.endpoints: [
  "ES_CORE_API g1.data.duniter.fr 443",
  "ES_USER_API g1.data.duniter.fr 443",
  "ES_SUBSCRIPTION_API g1.data.duniter.fr 443"
]
duniter.mail.enable: false
duniter.ws.port: 9400-9410
duniter.subscription.enable: false
```

Then run docker-compose following commands:  
```
  $ docker-compose build  
  $ docker-compose up -d && docker-compose logs -f  
```

## Start pod for testing:  

```
  $ docker-compose exec cesium-plus-pod /bin/bash  
  cesium-plus-pod@cabe62ea6f21:~$ cd cesium-plus-pod-X.Y/bin
  cesium-plus-pod@cabe62ea6f21:~$ ./elasticsearch
```

## test:  
The following web address should works: http://localhost:9200/node/summary  

```
  $ curl http://localhost:9200/node/summary  
  {"duniter":{"software":"cesium-plus-pod","version":"1.9.1","status":200}}  
```

The pod should also be available in the Cesium application:  

  - In settings, enable to Cesium+ extension  
  - Replace the Pod address (e.g. localhost:9200 or <public_uri>:9200 / no ssl)  
  - check if profile’s avatar, grapĥ, etc. are displayed correctly.  


## Start pod for production (demonized):  

```
  $ docker-compose exec cesium-plus-pod /bin/bash  
  cesium-plus-pod@cabe62ea6f21:~$ cd cesium-plus-pod-X.Y/bin  
  cesium-plus-pod@cabe62ea6f21:~$ ./elasticsearch -d  
```

## TODO
- to solve : the pod is operational locally and via public access but seems unknown by cesium+ net
- to solve : data volume cannot be bind to a local host volume
- to solve : VOLUME /cesium-plus-pod/cesium-plus-pod cannot be bind to composer volume (local or docker)