# DEMP: Docker, Nginx, Mariadb and PostgreSQL Stack

[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

## Semantic Commit Message Policy

This repository follows [Semantic release](https://github.com/semantic-release/semantic-release#how-does-it-work) and [Semantic versioning](http://semver.org) .

## Usage

### Clone Repository and Change Password

```bash
cd /opt
git clone git@github.com:JustinTW/demp-stack.git demp-stack
cd demp-stack

# Optional: default db password for `root` is: `123456`, you can change password in file: `.env/config.env`
vi .env/config.env

# Optional: customize service name by replace `demp-stack` on all files
find . -type f -name "*" -print0 | xargs -0 sed -i "s/demp-stack/my-web-service/g"
mv /opt/demp-stack /opt/my-web-service
```

### Boot up containers

```
make up
```

### Customize nginx config

```bash
cd /opt/demp-stack/nginx/data/nginx

# write/edit your own config for nginx in ./sites-enabled folder
vi ./sites-enabled/***

# reload nginx
cd /opt/demp-stack/nginx
make reload

# or restart nginx
make restart
```

### Attach Shell to Development Environment

```
make at
```

### Stop Development Environment

```
make stop
```

### Clean all data

```
make stop
make clean
```
