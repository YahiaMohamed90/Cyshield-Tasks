FROM postman/newman:5.3-alpine

# Set DNS
RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf && \
    echo "nameserver 1.1.1.1" >> /etc/resolv.conf

# Update packages and install additional utilities
RUN apk update && apk upgrade && \
    apk add --no-cache curl zip ping && \
    npm install -g newman-reporter-csvallinone && \
    npm cache clean --force && \
    rm -rf /var/cache/apk/*

# Set environment variable
ENV NODE_PATH=/usr/local/lib/node_modules

# Set working directory
WORKDIR /etc/newman

# Set entry point
ENTRYPOINT ["newman"]
