# Thecladekker.nl Energetischreinigen.com

## Getting started

```bash
# 1 - get the latest prod data
ssh weteling.com dokku postgres:export teta-db | > volumes/db-data/live.pgdump

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
# # need to have buildx, to do so we need to export 2 vars for the dokku user
# echo "export DOCKER_BUILD_KIT=1" | sudo tee -a /etc/default/dokku
# echo "export DOCKER_CLI_EXPERIMENTAL=enabled" | sudo tee -a /etc/default/dokku

# git upstream
git remote add dokku dokku@weteling.com:teta

# project setup
dokku apps:create teta
dokku postgres:create teta-db
dokku postgres:link teta-db teta
dokku config:set teta RAILS_ENV=production
dokku config:set teta RAILS_LOG_TO_STDOUT=true
dokku config:set teta PORT=5000
dokku config:set teta RAILS_SERVE_STATIC_FILES=true
dokku domains:add teta thecladekker.nl
dokku domains:add teta energetischreinigen.nl
dokku domains:add teta www.thecladekker.nl
dokku domains:add teta www.energetischreinigen.nl
dokku domains:add teta teta.weteling.com
dokku letsencrypt:enable teta
dokku storage:mount teta /home/dokku/teta/public:/app/public
```

## /home/dokku/teta/nginx.conf.d/static.conf

```nginx
location ~ ^/assets|packs/ {
    root /home/dokku/teta/public;
    gzip_static on;
    expires max;
    add_header Cache-Control public;
}
```
