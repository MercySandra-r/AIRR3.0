# Use a lightweight web server
FROM nginx:alpine

# Copy your HTML file to the server's public folder
# Renaming it to index.html so it loads automatically
COPY transcript.html /usr/share/nginx/html/index.html

# Expose port 80 (Standard web port)
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]