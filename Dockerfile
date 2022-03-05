FROM node:16 


# Building Angular app
WORKDIR /app
#COPY /package.json /app
COPY . .
RUN npm install
#COPY . /app

# Creating bundle
#RUN npm run build 

#stage 2
#FROM nginx:alpine
#COPY --from=node-angular-cli /app/dist/my-app-angular /usr/share/nginx/html
