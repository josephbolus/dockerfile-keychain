[![](https://badge.imagelayers.io/uzyexe/keychain:latest.svg)](https://imagelayers.io/?images=uzyexe/keychain:latest 'Get your own badge on imagelayers.io')

# uzyexe/keychain [![Circle CI](https://circleci.com/gh/uzyexe/dockerfile-keychain.svg?style=svg)](https://circleci.com/gh/uzyexe/dockerfile-keychain)

## What is keychain.io

keychain.io is simple service to put your public key on servers for easy login (via SSH).
keychain.io use s3, sendgrid email.

[http://keychain.io](https://github.com/progrium/keychain.io)

## Dockerfile

[**Trusted Build**](https://hub.docker.com/r/uzyexe/keychain/)

This Docker image is based on the official [alpine:3.4](https://hub.docker.com/_/alpine/) base image.

## How to use this image

Create s3 backet.

[http://aws.amazon.com/s3/](http://aws.amazon.com/s3/)

Create sendgrid account.

[http://sendgrid.com](http://sendgrid.com)

Starting keychain.io container.

```
docker run \
  -e AWS_ACCESS_KEY_ID=abc123 \
  -e AWS_SECRET_ACCESS_KEY=abcd1234 \
  -e KEYCHAIN_BUCKET_NAME=s3.bucket.name \
  -e SENDGRID_USERNAME=username \
  -e SENDGRID_PASSWORD=password \
  -p 5000:5000
  uzyexe/keychain
```

## Upload your default SSH key

```
curl -s example.keychain.io:5000/<email>/upload | bash
```

## Install your key into authorized_keys

```
curl -s example.keychain.io:5000/<email>/install | bash
```

## API URLs

```
example.keychain.io:5000/<email>
example.keychain.io:5000/<email>/upload
example.keychain.io:5000/<email>/install
example.keychain.io:5000/<email>/fingerprint
example.keychain.io:5000/<email>/confirm/<token>
example.keychain.io:5000/<email>/all
example.keychain.io:5000/<email>/all/install
example.keychain.io:5000/<email>/<namedkey>
example.keychain.io:5000/<email>/<namedkey>/fingerprint
example.keychain.io:5000/<email>/<namedkey>/install
example.keychain.io:5000/<email>/<namedkey>/upload
```

