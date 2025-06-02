FROM node:22-slim

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 9000

COPY .env .env

ENV NODE_ENV=development

CMD ["npm", "run", "dev"]
