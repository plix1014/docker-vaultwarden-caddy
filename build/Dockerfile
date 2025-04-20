
ARG CADDY_VERSION=0.0.0

FROM golang:1.24-alpine AS builder

# Install build dependencies
RUN apk add --no-cache git build-base

# Install xcaddy
RUN go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest

# Build Caddy with plugins
RUN xcaddy build \
    --output /usr/local/bin/caddy \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddyserver/zerossl \
    --with github.com/caddy-dns/duckdns

# Final image
FROM caddy:${CADDY_VERSION}-alpine
COPY --from=builder /usr/local/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy"]

