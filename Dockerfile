FROM nginx:alpine

# Copy project static assets to Nginx default html web root
COPY html/ /usr/share/nginx/html/
COPY css/ /usr/share/nginx/html/css/
COPY script/ /usr/share/nginx/html/script/

# Expose standard web server port
EXPOSE 80

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]