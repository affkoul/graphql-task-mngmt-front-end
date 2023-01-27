FROM node:16.17.0 AS PRODUCTION

WORKDIR /

COPY package.json .
COPY package-lock.json .

RUN npm install

RUN mkdir node_modules/.cache && chmod -R 777 node_modules/.cache

COPY . .

RUN npm run build

CMD [ "npm", "run", "build" ]