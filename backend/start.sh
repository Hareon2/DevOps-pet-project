#!/bin/bash

# Применяем миграции Prisma
npx prisma migrate dev --name init

# Запускаем приложение
npm run start