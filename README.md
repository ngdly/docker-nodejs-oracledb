# nodejs-oracledb

### Running a nodejs enabled app container

docker run -p 3000:3000 -v /work/docker/oraclelinux/web:/root/nodeweb ngdly/nodejs-oracledb node /root/nodeweb/index.js

##### Similar configuration in docker-compose.yml may look like this:

```
web:
  image: ngdly/nodejs-oracledb
  volumes:
    - ./web:/root/nodeweb
  ports:
    - 3001:3000
  command: [node,/root/nodeweb/index.js]
```