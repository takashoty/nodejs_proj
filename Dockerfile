FROM node:latest

WORKDIR /usr/src/app

ENV EX="this is env"

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080

CMD [ "node", "server.js" ]