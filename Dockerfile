FROM alpine:3.2

RUN apk add --update python-dev py-pip ruby ruby-dev gcc musl-dev git && \
    pip install Flask==0.9 requests==0.14.1 boto==2.6.0 eventlet==0.9.17 && \
    gem install foreman --no-ri --no-rdoc && \
    git clone https://github.com/progrium/keychain.io.git && \
    apk del --purge git gcc musl-dev && \
    rm -rf /var/cache/apk/*

ENV YOUR_AWS_ACCESS_KEY_ID      **FALSE**
ENV YOUR_AWS_SECRET_ACCESS_KEY  **FALSE**
ENV YOUR_SENDGRID_USERNAME      **FALSE**
ENV YOUR_SENDGRID_PASSWORD      **FALSE**
ENV YOUR_KEYCHAIN_BUCKET_NAME   **FALSE**

ADD run.sh /run.sh

CMD ["/run.sh"]

EXPOSE 5000
