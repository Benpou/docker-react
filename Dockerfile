FROM node:alpine as builder

#Info
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

#Finich phase one 
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
