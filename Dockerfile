# Base image
FROM node:18-alpine AS dependencies

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json package-lock.json ./

# Install dependencies with legacy-peer-deps (if you are having dependency conflicts)
RUN npm install --legacy-peer-deps

# Copy the rest of the code
COPY . ./

# Build the Next.js app
RUN npm run build

# Expose port 3000
EXPOSE 3000

# Start the Next.js app
CMD ["npm", "start"]
