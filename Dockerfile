FROM node:latest as node-angular-cli
LABEL authors="Vaishnavi"
 
# Building Angular app
WORKDIR /app
#COPY /package.json /app
COPY . .
RUN npm install
#COPY . /app

# Creating bundle
RUN npm run build 
 
#stage 2
FROM nginx:alpine
COPY --from=node-angular-cli /app/dist/my-app-angular /usr/share/nginx/html

#WORKDIR /app/dist/browser
#EXPOSE 80
#ENV PORT 80
#RUN npm install http-server -g
#CMD [ "http-server" ]