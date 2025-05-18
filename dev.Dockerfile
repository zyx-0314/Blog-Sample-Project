FROM node:lts-alpine3.20

ARG developer_name=ian
ARG developer_group=developer
ARG manual_qa=cedric
ARG manual_qa_group=qa
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

# groups & users (fewer layers)
RUN addgroup -S ${developer_group} \
  && adduser  -S ${developer_name} -G ${developer_group} -h /home/${developer_name} \
  && addgroup -S ${manual_qa_group} \
  && adduser  -S ${manual_qa}      -G ${manual_qa_group} -h /home/${manual_qa}

WORKDIR /app

COPY package*.json ./
RUN npm install --no-audit --prefer-offline --progress=false

# code comes in after deps
COPY . .                                   

RUN chown -R ${developer_name}:${developer_group} /app \
  && chmod -R 775 /app \
  && apk add --no-cache acl \
  && setfacl -R -m u:${manual_qa}:rx /app

USER ${developer_name}

EXPOSE 3003
CMD ["npm","run","dev","--","-p","3003"]
