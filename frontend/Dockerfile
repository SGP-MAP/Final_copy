FROM node:18-alpine AS build

WORKDIR /app

COPY package.json ./

RUN yarn  install

COPY . /app

RUN yarn build

FROM node:18-alpine

WORKDIR /src

RUN npm install -g server

COPY --from=build /app/build ./build

CMD server -d ./build
