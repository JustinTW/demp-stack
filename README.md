# Wallet Landing Page Server

[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

## Semantic Commit Message Policy

This repository follows [Semantic release](https://github.com/semantic-release/semantic-release#how-does-it-work) and [Semantic versioning](http://semver.org) .

## Usage

### Clone Repository and Change Password

```
sudo -i
cd /opt
git clone git@github.com:MarsBlockchain/wallet-landing-page-server.git web-service
cd web-service

# Optional: default db password for `root` is: `123456`, you can change password in file: `.env/config.env`
vi .env/config.env
```

### Boot up containers

```
make up
```

### Setup nginx config

```
cd /opt/web-service/nginx/data/nginx

# write/edit your config for nginx in ./sites-enabled folder
vi ./sites-enabled/***

# reload nginx
cd /opt/web-service/nginx
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