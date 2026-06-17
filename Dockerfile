    # Use light and secure Node LTS alpine image
    FROM node:20-alpine

    # Create app directory
    WORKDIR /app

    # Copy package configuration files
    COPY package*.json ./

    # Install only production dependencies
    RUN npm ci --only=production

    # Copy application source code
    COPY index.js ./

    # Expose port (default 3001)
    EXPOSE 7168

    # Define default environment variables
    ENV PORT=7168
    ENV NEXT_PUBLIC_APP_URL=rentcar.rawaes.com
    # Start server
    CMD ["node", "index.js"]
