FROM node:alpine as builder
WORKDIR /usr/local/app/
COPY package.json .
RUN npm install
RUN npm update
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /usr/local/app/build /usr/share/nginx/html
#COPY --from=builder ./build /usr/share/nginx/html