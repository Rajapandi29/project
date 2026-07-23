# Use lightweight Node.js image
FROM node:22-alpine

# Create application directory
WORKDIR /app

# Copy package file
COPY package.json .

# Install dependencies
RUN npm install

# Copy application source code
COPY . .


# Application port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]