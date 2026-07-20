# Use the Ubuntu-based n8n image (which has apt-get and current repositories)
FROM n8nio/n8n:latest-ubuntu

# Switch to root to install packages
USER root

# Install Python, pip, and qpdf
RUN apt-get update && \
    apt-get install -y python3 python3-pip qpdf && \
    pip3 install pypdf pdfplumber && \
    apt-get clean

# Switch back to the n8n user
USER node

# Keep the default entrypoint
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
