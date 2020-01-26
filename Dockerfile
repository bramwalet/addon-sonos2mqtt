ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

WORKDIR /usr/src/app

# install required dependencies
RUN apk add --no-cache nodejs-current npm jq

# install sonos2mqtt bridge
COPY package*.json ./
RUN npm ci --only=production

# copy to destination 
COPY . .
COPY run.sh /
RUN chmod a+x /run.sh

#expose listen port
EXPOSE 6329

CMD [ "/run.sh" ]
