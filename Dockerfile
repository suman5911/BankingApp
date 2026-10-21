FROM node:20-slim
WORKDIR /usr/src/app
RUN apt-get update \
    && apt-get install -y --no-install-recommends python3 make g++ \
    && rm -rf /var/lib/apt/lists/*
COPY package*.json ./
RUN npm install --omit=dev && npm cache clean --force
COPY --chown=node:node . .
RUN chown node:node /usr/src/app
USER node
EXPOSE 5090
CMD ["node", "server.js"]
