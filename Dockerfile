FROM debian:latest

RUN apt-get update
RUN echo "y" | apt-get install libsqlite3-dev
RUN apt-get update && apt-get install -y build-essential nodejs
RUN apt-get -y install python python-pip
RUN apt-get -y install ruby ruby-dev
RUN apt-get -y install git
RUN apt-get install zlib1g-dev
RUN apt-get install libxml2
RUN apt-get update && apt-get install -y procps
RUN pip install -U pre-commit

RUN pip install requests
RUN pip install sklearn
RUN pip install argparse

RUN mkdir /tornado
COPY . /tornado
WORKDIR /tornado

RUN gem install sqlite3 -v '1.3.13' --source 'https://rubygems.org/'
RUN gem update --system
RUN gem install rails
