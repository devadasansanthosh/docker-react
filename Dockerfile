FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
CMD ["npm", "run", "build"]
RUN pwd

FROM nginx
EXPOSE 80
COPY --from=builder ./ /usr/share/nginx/html

