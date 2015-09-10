FROM ubuntu:trusty

RUN apt-get install -y wget
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

RUN apt-get update
RUN apt-get install -y git nodejs nodejs-legacy npm firefox google-chrome-stable xvfb default-jre

RUN npm install -g jasmine-node karma-firefox-launcher karma-chrome-launcher protractor

RUN npm update
RUN webdriver-manager update

ENV HOME /protractor/project/

WORKDIR /protractor/

COPY . /protractor/scripts/

CMD ["/protractor/scripts/run-e2e-tests.sh"]
