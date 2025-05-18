# Stage 1: Build
FROM node:lts-alpine3.20

WORKDIR /app

USER root

COPY package.json package-lock.json ./

RUN npm i --no-audit --prefer-offline --progress=false

COPY . .

RUN npm run build

# Stage 2: Production
FROM node:lts-alpine3.20

ARG developer_name="ian"
ARG developer_group="developer"
ARG manual_qa="cedric"
ARG manual_qa_group="qa"
ARG NODE_ENV=production

ENV NODE_ENV=${NODE_ENV}

RUN addgroup -S ${developer_group} # create a group. -S means system group
RUN adduser -S ${developer_name} -G ${developer_group} -h /home/${developer_name} # create a user. -S means system user. -G means group. -h means home directory

RUN addgroup -S ${manual_qa_group} # create a group. -S means system group
RUN adduser -S ${manual_qa} -G ${manual_qa_group} -h /home/${manual_qa} # create a user. -S means system user. -G means group. -h means home directory

WORKDIR /app

RUN chown -R ${developer_name}:${developer_group} /app # change ownership of the /app directory to the developer user and group

RUN apk add --no-cache acl # install acl package for setfacl command
RUN chmod -R 775 /app # change permissions of the /app directory to allow read, write and execute for user and group
RUN setfacl -R -m u:${manual_qa}:rx /app # give qa user read and execute permissions on /app directory recursively

COPY --from=0 /app/.next ./.next
COPY --from=0 /app/package.json ./
COPY --from=0 /app/package-lock.json ./
COPY --from=0 /app/node_modules ./node_modules
COPY --from=0 /app/public ./public
COPY --from=0 /app/prisma ./prisma
COPY --from=0 /app/.env ./
COPY --from=0 /app/next.config.ts ./
COPY --from=0 /app/tsconfig.json ./

USER ${manual_qa} # switch to developer user

EXPOSE 3004
RUN npm run start