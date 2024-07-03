# Use Node.js version 20 as the base image
FROM node:20

# Set the working directory inside the container to /app
WORKDIR /app

# Copy package.json and package-lock.json (or any file matching package*.json) to the working directory
COPY package*.json ./
# Install the dependencies specified in package.json
RUN npm install

# Copy the prisma directory to the working directory
COPY prisma ./prisma
# Generate Prisma client based on the Prisma schema
RUN npx prisma generate

# Copy the rest of the application code to the working directory
COPY . .

# Make the start.sh script executable
RUN chmod +x ./start.sh
