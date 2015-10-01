FROM phusion/baseimage:0.9.16

MAINTAINER Bo Stauffer-Olsen <@BoStaufferOlsen>

RUN apt-get -yqq update
RUN apt-get -yq install curl
RUN apt-get -yq install python-software-properties
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get -yqq update
RUN apt-get -yq install nodejs inotify-tools
RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import -
#RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN curl -L https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "echo insecure > ~/.curlrc"
RUN apt-get -yq install ca-certificates
RUN /bin/bash -l -c "rvm install 2.0"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"
RUN /bin/bash -l -c "gem install rb-inotify"
RUN /bin/bash -l -c "gem install jekyll"

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /etc/service/jekyll
ADD jekyll.sh /etc/service/jekyll/run


WORKDIR /jimstauffer
EXPOSE 8000
VOLUME /jimstauffer
