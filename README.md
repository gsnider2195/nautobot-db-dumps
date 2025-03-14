# Nautobot Database Dumps

This repository contains database dumps for Nautobot databases fully migrated for each minor version of nautobot and the `latest` version. The dumps are provided in both PostgreSQL and MySQL formats and can be used in development environments to skip the migration process. If the file is mounted to the `/docker-entrypoint-initdb.d/` directory in a MySQL or PostgreSQL Docker container, the database will be initialized with the data from the dump file every time the database is initialized. In a typical Nautobot app development environment, the database data will be persisted until the persistent volume is deleted with `invoke destroy`.

The dumps are provided in the `dumps` branch of this repository. The `main` branch contains the GitHub actions workflows used to generate the files and this README. The `dumps` branch is regenerated weekly.

## Usage

Clone this repository's `dumps` branch using `git clone --depth 1 https://github.com/gsnider2195/nautobot-db-dumps.git --branch dumps`. Then you can copy the desired dump file to your development environment to be used in your docker compose file. The examples below use a sql dump file copied to the `development` directory of a Nautobot app repository.

### Example PostgreSQL Docker Compose File

```yaml
---
services:
  db:
    image: "postgres:13-alpine"
    command:
      - "-c"
      - "max_connections=200"
    env_file:
      - "development.env"
      - "creds.env"
    volumes:
      - "postgres_data:/var/lib/postgresql/data"
      - "./nautobot2.4.0-pgdump.sql:/docker-entrypoint-initdb.d/nautobot.sql"
    healthcheck:
      test: "pg_isready --username=$$POSTGRES_USER --dbname=$$POSTGRES_DB"
      interval: "10s"
      timeout: "5s"
      retries: 10
volumes:
  postgres_data: {}
```

### Example MySQL Docker Compose File

```yaml
---
services:
  db:
    image: "mysql:8"
    command:
      - "--max_connections=1000"
    env_file:
      - "development.env"
      - "creds.env"
      - "development_mysql.env"
    volumes:
      - "mysql_data:/var/lib/mysql"
      - "./nautobot2.4.0-mysqldump.sql:/docker-entrypoint-initdb.d/nautobot.sql"
    healthcheck:
      test:
        - "CMD"
        - "mysqladmin"
        - "ping"
        - "-h"
        - "localhost"
      timeout: "20s"
      retries: 10
volumes:
  mysql_data: {}    
```
