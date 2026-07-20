# Use the official n8n Alpine image
FROM n8nio/n8n:latest

# Switch to root to install packages
USER root

# Install Python, pip, and qpdf using apk (Alpine package manager)
RUN apk add --no-cache python3 py3-pip qpdf && \
    pip3 install pypdf pdfplumber

# Switch back to the n8n user
USER node

# Keep the default entrypoint
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
