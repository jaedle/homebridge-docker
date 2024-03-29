FROM node:18-slim as builder
RUN apt-get update && apt-get install --yes \
	git \
	g++ \
	libatomic1 \
	make \
	python3

WORKDIR /homebridge
COPY package.json .

RUN npm install homebridge
COPY plugins.txt .
RUN npm install $(cat plugins.txt | tr '\n' ' ')

FROM node:16-slim
RUN apt-get update && apt-get install --yes \
	libatomic1
WORKDIR /homebridge
COPY --from=builder /homebridge .
VOLUME /homebridge/config

CMD [ "npm", "run", "start", "--", "-U", "/homebridge/config", "-I" ]
