# 1️⃣ Use the official Node.js image
FROM node:18-alpine AS builder

# 2️⃣ Set working directory inside the container
WORKDIR /app

# 3️⃣ Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# 4️⃣ Copy the source code and build TypeScript
COPY . .
RUN npm run build

# 5️⃣ Use a smaller image for the final container
FROM node:18-alpine

WORKDIR /app

# 6️⃣ Copy only compiled JS code and dependencies from the builder
COPY --from=builder /app/package*.json ./
RUN npm install --omit=dev

COPY --from=builder /app/dist ./dist

# 7️⃣ Expose the port (Cloud Run uses PORT env variable)
EXPOSE 8080

# 8️⃣ Start the app
CMD ["node", "dist/server.js"]
