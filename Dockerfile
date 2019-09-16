FROM node:alpine as builder
WORKDIR /usr/local/app/
COPY package.json .
RUN npm install
# What we will update outside container
RUN npm update
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /usr/local/app/build /usr/share/nginx/html
