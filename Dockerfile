FROM node:20-alpine AS builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <----- all the stuff

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
