FROM nginx:alpine

RUN mkdir -p /usr/share/nginx/html/test/
COPY ./test/index.html /usr/share/nginx/html/test/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
