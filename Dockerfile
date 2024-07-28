FROM node:18.16.0 as build
ARG REACT_APP_TG_API_ID=924859
ARG REACT_APP_TG_API_HASH=a4c9a18cf4d8cb24062ff6916597f832

COPY yarn.lock .
COPY package.json .
COPY api/package.json api/package.json
COPY web/package.json web/package.json
COPY ./docker/.env .
RUN yarn cache clean
RUN yarn install --network-timeout 1000000
COPY . .
RUN yarn workspaces run build
