FROM nginx:1.13.5-alpine

# Install iptables and su-exec
RUN apk update && \
    apk add iptables && \
    apk add su-exec

# Copy the script to the container
COPY entrypoint.sh /entrypoint.sh

# Set executable permissions on the script
RUN chmod +x /entrypoint.sh

# Running nginx with the script as the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]

