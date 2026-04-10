# ─────────────────────────────────────────────────────────────────
#  Global Obras – Static Site
#  Serve via Nginx Alpine (minimal image, fast cold-start)
# ─────────────────────────────────────────────────────────────────
FROM nginx:1.27-alpine

# Remove default Nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy site files
COPY index.html /usr/share/nginx/html/index.html
COPY public/    /usr/share/nginx/html/public/
COPY design-system/ /usr/share/nginx/html/design-system/

# Custom Nginx config: gzip + SPA-friendly fallback + security headers
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
