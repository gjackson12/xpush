FROM node:latest

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app/package.json
RUN npm install
RUN npm install -g @angular/cli

# add app
COPY . /usr/src/app

EXPOSE 4200

# start app
CMD ng serve --host 0.0.0.0 --disableHostCheck true