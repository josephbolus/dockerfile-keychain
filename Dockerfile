FROM debian:wheezy

RUN apt-get update -qq
RUN apt-get install -qy git python-dev python-pip ruby ruby-dev rubygems
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir /keychain
RUN git clone https://github.com/progrium/keychain.io.git /keychain

WORKDIR /keychain
RUN pip install -r requirements.txt
RUN gem install foreman --no-ri --no-rdoc

EXPOSE 5000

CMD ["/usr/local/bin/foreman", "start"]
