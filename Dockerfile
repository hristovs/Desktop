# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory to /usr/src/app
WORKDIR /usr/src/app

# Debugging: Print the current directory and its content
RUN pwd
RUN ls -la

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Debugging: Print the content of the working directory after copying package files
RUN ls -la

# Install app dependencies
RUN npm install

COPY . ./


# Build TypeScript code
RUN npm run build

# Expose port 3000 (adjust if your app listens on a different port)
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
