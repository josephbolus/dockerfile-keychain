FROM debian:squeeze

RUN apt-get update -qq
RUN apt-get install -qy git python-dev python-pip ruby rubygems
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/progrium/keychain.io.git ./keychain
WORKDIR ./keychain

RUN pip install -r requirements.txt
RUN gem install foreman --no-ri --no-rdoc

EXPOSE 5000

CMD ["foreman", "start"]
