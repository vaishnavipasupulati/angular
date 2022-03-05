FROM node:8.9-alpine as node-angular-cli
LABEL authors="Ravi Kiran"
 
# Building Angular app
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build:ssr
 
FROM node:8.9-alpine
WORKDIR /app
COPY --from=node-angular-cli /app/dist ./dist
EXPOSE 80
ENV PORT 80
CMD [ "node", "dist/server.js" ]
