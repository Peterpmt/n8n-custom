# Use a base image that has both Node.js and Python
FROM node:18-bullseye

# Install Python and qpdf
RUN apt-get update && \
    apt-get install -y python3 python3-pip qpdf && \
    pip3 install pypdf pdfplumber && \
    apt-get clean

# Install n8n globally via npm
RUN npm install n8n -g

# Set environment variables
ENV N8N_BASIC_AUTH_ACTIVE=true \
    N8N_SECURE_COOKIE=false

# Expose the default n8n port
EXPOSE 5678

# Start n8n
CMD ["n8n", "start"]
