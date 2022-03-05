FROM node:17-alpine3.14 



WORKDIR /usr/src/app

COPY . .
#RUN npm install


#COPY . /app

# Creating bundle
RUN npm run build 

#stage 2
#FROM nginx:alpine
#COPY --from=node-angular-cli /app/dist/my-app-angular /usr/share/nginx/html
