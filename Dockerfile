FROM node:11-alpine

WORKDIR /usr/src/app

# Install dependencies in a specific step to take advantage of the docker build cache
COPY package.json yarn.lock ./
RUN yarn install --production --frozen-lockfile --non-interactive

COPY . .

EXPOSE 8000

CMD [ "npm", "start" ]
