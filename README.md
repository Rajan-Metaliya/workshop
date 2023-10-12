
## Running the project

### Prerequisites

- Install Flutter SDK version 3.0.0 or higher (Current project version: 3.13.6)

- run below command to install serverpod

```bash
    dart pub global activate serverpod_cli
```

test serverpod installation by running below command

```bash
    serverpod
```


### Running server for development

- Open docker desktop and start docker

- Open terminal and run below command to start server

```bash
    cd workshop_server
    docker compose up --build --detach
    dart bin/main.dart
```


docker cp ./generated/tables-serverpod.pgsql workshop_server-postgres-1:/docker-entrypoint-initdb.d/tables-serverpod.pgsql

$ docker exec -u postgres workshop_server psql workshop postgres -f docker-entrypoint-initdb.d/tables-serverpod.pgsql