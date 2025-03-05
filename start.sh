#!/bin/bash
docker compose up --build -d
docker exec -it backend sh -c "npx prisma migrate dev --name init"

