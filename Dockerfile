FROM ubuntu:18.04

LABEL maintainer="Aditya Satrya <aditya.satrya@gmail.com>"

RUN apt-get update
RUN apt-get install -y git

# node
RUN apt-get install -y nodejs
RUN apt-get install -y npm

# copy whole kepler-demo app and run install
WORKDIR /kepler-demo
COPY . .
RUN npm install

ENV PATH "$PATH:/kepler-demo/node_modules/.bin"

EXPOSE 80

# CMD [ "tail", "-f", "/dev/null" ]
CMD ["webpack-dev-server", "--progress", "--hot", "--port", "80", "--host", "0.0.0.0"]