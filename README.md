# uzyexe/keychain

## What is keychain.io

keychain.io is simple service to put your public key on servers for easy login (via SSH).
keychain.io use s3, sendgrid email.

[http://keychain.io](http://keychain.io)
[http://aws.amazon.com/s3/](http://aws.amazon.com/s3/)
[http://sendgrid.com](http://sendgrid.com)

## Dockerfile

[**Trusted Build**](https://registry.hub.docker.com/u/uzyexe/keychain/)

This Docker image is based on the [debian:wheezy](https://registry.hub.docker.com/_/debian/) base image.

## How to use this image

Create s3 backet.

[http://aws.amazon.com/s3/](http://aws.amazon.com/s3/)

Create sendgrid account.

[http://sendgrid.com](http://sendgrid.com)

Make /keychain directory.

```
$ mkdir /keychain
```

Create a /keychain/.env file.

```
$ cat /keychain/.env
AWS_ACCESS_KEY_ID=abc123
AWS_SECRET_ACCESS_KEY=abcd1234
SENDGRID_USERNAME=ryan
SENDGRID_PASSWORD=password
KEYCHAIN_BUCKET_NAME=keychain.io
```

Starting keychain.io container.

```
docker run -d -v /keychain/.env:/keychain/.env:ro -p 5000:5000 uzyexe/keychain
```

## Upload your default SSH key

```
curl -s example.keychain.io/<email>/upload | bash
```

## Install your key into authorized_keys

```
curl -s example.keychain.io/<email>/install | bash
```

## API URLs

```
example.keychain.io/<email>
example.keychain.io/<email>/upload
example.keychain.io/<email>/install
example.keychain.io/<email>/fingerprint
example.keychain.io/<email>/confirm/<token>
example.keychain.io/<email>/all
example.keychain.io/<email>/all/install
example.keychain.io/<email>/<namedkey>
example.keychain.io/<email>/<namedkey>/fingerprint
example.keychain.io/<email>/<namedkey>/install
example.keychain.io/<email>/<namedkey>/upload
```

