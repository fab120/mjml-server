FROM node:11-alpine

WORKDIR /usr/src/app

COPY . .

RUN yarn install --production --frozen-lockfile --non-interactive

EXPOSE 8000

CMD [ "npm", "start" ]
