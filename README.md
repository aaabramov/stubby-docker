Docker image for [stubby4node, a.k.a. stubby](https://github.com/mrak/stubby4node)

## Usage

### Create endpoint configuration file

Create endpoint config yml file (see [Example](https://github.com/mrak/stubby4node/blob/master/test/data/e2e.yaml)) in your project stub folder eg: `stubs/endpoints.yml`

Reference: https://github.com/mrak/stubby4node

### Create stub response files
Create stub response json files in your project `stubs` folder ([Configuration reference](https://github.com/mrak/stubby4node#endpoint-configuration))

### Start container

#### docker-compose.yml
```
version: '3.8'

services:
  stub:
    image: aaabramov/stubby-server
    volumes:
      - "./stubs:/stubs"
    ports:
      - 8882:8882 # ADMIN
      - 8889:8889 # STUB
    environment:
      - STUB_DATA=/stubs/endpoints.yml
      - ADMIN_PORT=1234 # optional, default 8889
      - STUB_PORT=5678  # optional, default 8882
```

#### Run command
```
docker-compose up -d stub

$ http http://localhost:8882/basic/get

HTTP/1.1 200 OK
Connection: keep-alive
Date: Fri, 08 Apr 2022 17:22:15 GMT
Keep-Alive: timeout=5
Server: stubby/5.1.0 node/v16.11.1 (linux x64)
Transfer-Encoding: chunked
x-stubby-resource-id: 1

$ http http://localhost:8882/get/body

HTTP/1.1 200 OK
Connection: keep-alive
Date: Fri, 08 Apr 2022 17:22:58 GMT
Keep-Alive: timeout=5
Server: stubby/5.1.0 node/v16.11.1 (linux x64)
Transfer-Encoding: chunked
x-stubby-resource-id: 8

plain text

$ http http://localhost:8882/get/json

HTTP/1.1 200 OK
Connection: keep-alive
Date: Fri, 08 Apr 2022 17:23:00 GMT
Keep-Alive: timeout=5
Server: stubby/5.1.0 node/v16.11.1 (linux x64)
Transfer-Encoding: chunked
content-type: application/json
x-stubby-resource-id: 9

{
    "property": "value"
}
```

### Change stubs

- When changing stub response json files, stub response is updated automatically.
- Stubs are automatically reloaded on file change (Endpoint configuration file is being watched).

 






