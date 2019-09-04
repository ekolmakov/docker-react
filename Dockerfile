FROM node:alpine as builder
WORKDIR /usr/local/app/
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /usr/local/app/build /usr/share/nginx/html
#COPY --from=builder ./build /usr/share/nginx/html