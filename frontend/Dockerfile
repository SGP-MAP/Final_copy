FROM node:18-alpine AS build

WORKDIR /app

COPY package.json /app/package.json

RUN apk add yarn
RUN yarn  install --production




FROM node:18-alpine AS build_stage

COPY --from=build /app/node_modules/ /app/node_modules

WORKDIR /app

COPY . .

RUN yarn build


FROM node:18-alpine AS server

COPY --from=build_stage /app/build /app/build

RUN npm install -g serve


CMD server -s /app/build -l 3000
