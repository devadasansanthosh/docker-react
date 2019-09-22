FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
CMD ["npm", "run", "build"]

FROM nginx
EXPOSE 80
WORKDIR '/usr/share/nginx/html'
RUN ls
COPY --from=builder ./app/build ./

