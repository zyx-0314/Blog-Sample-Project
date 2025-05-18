# Stage 1: Build
FROM node:lts-alpine3.20 AS builder

WORKDIR /app

USER root

COPY package*.json ./

RUN npm ci --no-audit --prefer-offline --progress=false

COPY . .

RUN npm run build

### Stage 2: runtime
FROM node:lts-alpine3.20 AS runtime

ARG developer_name=ian
ARG developer_group=developer
ENV NODE_ENV=production

RUN addgroup -S ${developer_group} \
  && adduser  -S ${developer_name} -G ${developer_group}

WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev --no-audit --prefer-offline --progress=false

# Note:
# --omit=dev means omit dev dependencies

COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public

# Note:
# --from=builder means copy from builder stage

USER ${developer_name}
EXPOSE 3004
CMD ["npm","run","start","--","-p","3004"]
