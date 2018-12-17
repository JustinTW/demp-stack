# Docker Web Development Stack

[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

## Semantic Commit Message Policy

This repository follows [Semantic release](https://github.com/semantic-release/semantic-release#how-does-it-work) and [Semantic versioning](http://semver.org) .

## Usage

### Clone Repository and Change Password

```bash
git clone git@github.com:MarsBlockchain/docker-web-dev-stack.git web-stack
cd web-stack

# Optional: default db password for `root` is: `123456`, you can change password in file: `.env/config.env`
vi .env/config.env

# Optional: customize service name by replace `web-stack` on all files
find . -type f -name "*" -print0 | xargs -0 sed -i "s/web-stack/my-web-service/g"
```

### Boot up containers

```
make up
```

### Customize nginx config

```bash
cd nginx/data/nginx

# write / edit your own config for nginx in ./sites-enabled folder
vi ./sites-enabled/***

# reload nginx
cd nginx
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
