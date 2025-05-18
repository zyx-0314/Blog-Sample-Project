FROM node:lts-alpine3.20

ARG developer_name=ian
ARG developer_group=developer
ARG manual_qa=cedric
ARG manual_qa_group=qa
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

RUN addgroup -S ${developer_group} \
  && adduser  -S ${developer_name} -G ${developer_group} -h /home/${developer_name} \
  && addgroup -S ${manual_qa_group} \
  && adduser  -S ${manual_qa}      -G ${manual_qa_group} -h /home/${manual_qa}

# Note:
# -S means system user/group
# -G means group
# -h means home directory

WORKDIR /app

COPY package*.json ./
RUN npm i --force --no-audit --prefer-offline --progress=false

# Note:
# ci means clean install
# --prefer-offline means prefer offline packages
# --progress=false means do not show progress
# --no-audit means do not audit the package

COPY . .
RUN chown -R ${developer_name}:${developer_group} /app \
  && chmod -R 775 /app \
  && apk add --no-cache acl \
  && setfacl -R -m u:${manual_qa}:rx /app

# Note:
# -R means recursively
# -m means modify
# -u means user
# -rx means read and execute permissions
# -w means write permissions
# --no-cache means do not cache the package
# acl means access control list
# setfacl means set file access control list
# chown means change ownership

USER ${developer_name}

EXPOSE 3003
CMD ["npm","run","dev","--","-p","3003"]
