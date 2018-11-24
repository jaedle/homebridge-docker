FROM arm32v7/node:10-slim as builder
RUN apt-get update && apt-get install --yes \
	g++ \
	make \
	python

WORKDIR /homebridge
COPY package.json .

RUN npm install homebridge
COPY plugins.txt .
RUN npm install $(cat plugins.txt | tr '\n' ' ')

FROM arm32v7/node:10-slim
WORKDIR /homebridge
COPY --from=builder /homebridge .
VOLUME /homebridge/config

CMD ["npm", "run", "start", "--", "-U", "/homebridge/config"]