# Gebruik een basis NGINX-image
FROM nginx:alpine

# Installeer git om de bestanden van GitHub te kunnen halen
RUN apk add --no-cache git

# Maak een map aan voor de websitebestanden
RUN mkdir /usr/share/nginx/html/mywebsite

# Clone de GitHub-repository naar de juiste map
RUN git clone https://github.com/jouwgebruikersnaam/simple-portfolio.git /usr/share/nginx/html/mywebsite

# Verplaats de bestanden naar de standaard NGINX-serveermap
RUN cp -r /usr/share/nginx/html/mywebsite/* /usr/share/nginx/html/

# Expose poort 80 voor de webserver
EXPOSE 80

# Start NGINX in de foreground mode
CMD ["nginx", "-g", "daemon off;"]
