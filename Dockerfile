# Use an official Node.js image as a base image
FROM node:16-alpine

# Set the working directory to '/app' inside the container
WORKDIR /app

# Copy the package.json and yarn.lock files from the client directory to install dependencies first
COPY ./client/package.json ./client/yarn.lock ./client/

# Set the working directory to the client directory inside the container
WORKDIR /app/client

# Install dependencies
RUN yarn install

# Copy the rest of the frontend code from the client directory to the container
COPY ./client ./client

# Copy the 'types' directory from the root directory into the container (assuming 'types' is in the root directory)
COPY ./types ./types

# Expose the frontend port (default React port, e.g., 5173)
EXPOSE 5173

# Start the React app using the build command

CMD ["yarn", "dev"]
