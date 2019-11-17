## Usage

### Create endpoint configuration file

Create endpoint config yml file ([Example](https://github.com/mrak/stubby4node/blob/master/test/data/e2e.yaml)) in your project stub folder eg: `stubs/endpoints.yml`

Reference: https://github.com/mrak/stubby4node

### Create stub response files
Create stub response json files in your project `stubs` folder ([Configuration reference](https://github.com/mrak/stubby4node#endpoint-configuration))

### Start container

#### docker-compose.yml
```
version: '2'
services:
  stub:
    image: aaabramov/stubby-server
    volumes:
      - "./stubs:/stubs"
    ports:
      - 8882:8882
      - 8889:8889
    environment:
      - STUB_DATA=/stubs/endpoints.yml
      - ADMIN_PORT=1234 # optional, default 8889
      - STUB_PORT=5678  # optional, default 8882
```

#### Run command
```
docker-compose up -d stub

# access http://localhost:1234/status to view the stub configurations
# access http://localhost:5678/users to get the stub response
```

### Change stubs

When changing stub response json files, the stub response is updated automatically 

When changing endpoint config yml file stubs are automatically reloaded (Endpoint configuration file is being watched.)

 






