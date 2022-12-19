FROM node:lts-alpine

WORKDIR /app

COPY dist /app

RUN npm install --production

# Expor a porta definida na aplicação
EXPOSE 3000

CMD ["npm", "start"]