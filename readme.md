##Installation:  
check http://doc.e-is.pro/cesium-plus-pod/install.html for elasticsearch.yml config file setting.  

    $ docker-compose build  
    $ docker-compose up -d && docker-compose logs -f  

##Start pod for testing:  

    $ docker-compose exec cesium-plus-pod /bin/bash  
    cesium-plus-pod@cabe62ea6f21:~$ cd cesium-plus-pod-X.Y/bin
    cesium-plus-pod@cabe62ea6f21:~$ ./elasticsearch

##test:  
The following web address should works: http://localhost:9200/node/summary  

    $ curl http://localhost:9200/node/summary  
    {"duniter":{"software":"cesium-plus-pod","version":"1.9.1","status":200}}  

The pod should also be available in the Cesium application:  

    - In settings, enable to Cesium+ extension  
    - Replace the Pod address (e.g. localhost:9200 or <public_uri>:9200 / no ssl)  
    - check if profile’s avatar, grapĥ, etc. are displayed correctly.  


##Start pod for production (demonized):  

    $ docker-compose exec cesium-plus-pod /bin/bash  
    cesium-plus-pod@cabe62ea6f21:~$ cd cesium-plus-pod-X.Y/bin  
    cesium-plus-pod@cabe62ea6f21:~$ ./elasticsearch -d  
