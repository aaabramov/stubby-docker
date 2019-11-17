FROM node:alpine

RUN apk --no-cache add curl && \
	npm install -g stubby && \
	echo "Installed stubby version $(stubby -v)"

COPY ["scripts/*", "/scripts/"]

WORKDIR /scripts

CMD [ "/bin/ash", "start.sh" ]