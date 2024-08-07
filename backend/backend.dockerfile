# Step 1: Use the official Node.js 20 image from Docker Hub
FROM node:20

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Step 4: Install the project dependencies
RUN npm install

# Step 5: Copy the Prisma client to the container
COPY prisma ./prisma

# Step 6: Generate the Prisma client
RUN npx prisma generate

# Step 7: Copy the entire project to the container
COPY . .

# Step 8: Make the start script executable
RUN chmod +x ./start.sh

# Step 9: Expose port 4000 for incoming connections
EXPOSE 4000

# Step 10: Define the command to run when the container starts
CMD ["node", "index.js"]
