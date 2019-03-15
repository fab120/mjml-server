FROM node:11-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install --only=production

COPY . .

EXPOSE 8000

CMD [ "npm", "start" ]
