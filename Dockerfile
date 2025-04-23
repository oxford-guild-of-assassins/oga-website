FROM node:22.13.1-slim AS build
WORKDIR /app
COPY ./ ./
RUN npm install
RUN npm install -g @angular/cli
RUN ng build --configuration production
FROM nginx:stable-alpine3.20-slim AS deploy
COPY ./nginx.conf /etc/nginx/
COPY --from=build app/dist/oga-website/browser /usr/share/nginx/html
