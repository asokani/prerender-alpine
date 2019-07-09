FROM node:10.15-alpine
ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROME_PATH=/usr/lib/chromium/

COPY ./package.json .
COPY ./server.js .
COPY ./yarn.lock .
COPY ./patches .

# use edge repositories
# RUN sed -i -e 's/v3\.8/edge/g' /etc/apk/repositories

# install chromium and clear cache
RUN apk add --update-cache chromium \
    && rm -rf /var/cache/apk/* /tmp/*

RUN npm i -g yarn
# install npm packages
RUN yarn install 

EXPOSE 3000

CMD ["node", "server.js"]
