FROM node:lts-bookworm-slim
RUN apt-get update && \
    apt-get install ca-certificates git -y && \
    git clone -b v3 https://github.com/Hideipnetwork/hideipnetwork-web.git
WORKDIR /hideipnetwork-web
RUN npm install 
ENTRYPOINT [ "npm","run","start" ]
