FROM node:20

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY prisma ./prisma

RUN npx prisma generate

COPY . .

RUN chmod +x ./start.sh

EXPOSE 4000

CMD ["node", "index.js"]

