FROM node:latest as node-angular-cli
LABEL authors="Vaishnavi"
 
ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /usr/src/app && cp -a /tmp/node_modules /usr/src/app/
WORKDIR /usr/src/app
COPY . /usr/src/app/


# Creating bundle
RUN npm run build --prod
 
#stage 2
FROM nginx:alpine
COPY --from=node-angular-cli /app/dist/my-app-angular /usr/share/nginx/html

