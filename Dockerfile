

FROM httpd:2.4

COPY dist /usr/local/apache2/htdocs

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]




# FROM node:lts-alpine

# WORKDIR /app

# COPY ./dist /app

# RUN npm install --omit=dev

# # Expor a porta definida na aplicação
# EXPOSE 3000

# CMD ["npm", "start"]