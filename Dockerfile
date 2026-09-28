# ---- Geumdo High School: Backend (Tier 2 - Application/API) ----
FROM node:18-alpine

WORKDIR /app

# Install dependencies first (better layer caching)
COPY package.json ./
RUN npm install --omit=dev

# Copy application source
COPY . .

EXPOSE 5000

CMD ["node", "server.js"]
