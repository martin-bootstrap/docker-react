FROM node:alpine as builder

WORKDIR '/app'

## build phase
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


## run phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
## default command is to start nginx