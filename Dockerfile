FROM nginx:stable-alpine3.20-slim AS deploy
COPY ./nginx.conf /etc/nginx/
COPY src /usr/share/nginx/html
