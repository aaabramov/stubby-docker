FROM node:16-alpine

COPY ["scripts/*", "/scripts/"]

RUN npm install -g stubby@5.1.0

WORKDIR /scripts

CMD [ "/bin/ash", "start.sh" ]