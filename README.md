# Thecladekker.nl Energetischreinigen.com

## Getting started

```bash
# 1 - get the latest prod data
ssh weteling.com dokku postgres:export teta | > volumes/db-data/live.pgdump

# 2 - start the app
docker compose up
```

## Debugging tools

```bash
# have docker compose up running
docker compose up -d
docker compose exec web bash
-->
bin/rails s

docker ps
docker stats
docker attach <img id>
```

bin/rails g alchemy:elements --skip -e slim

# Dokku setup

```bash
    dokku storage:mount teta /home/dokku/teta/static/assets:/app/public/assets
    dokku storage:mount teta /home/dokku/teta/static/packs:/app/public/packs
```

## /home/dokku/teta/nginx.conf.d/static.conf

```nginx
location ~ ^/assets|packs/ {
    root /home/dokku/teta/static;
    gzip_static on;
    expires max;
    add_header Cache-Control public;
}
```
