# Use uma imagem base específica
FROM node:21.6.0-alpine3.18

# Defina o diretório de trabalho
WORKDIR /home/node/app

# Copie o script start.sh para o contêiner
COPY .docker/start.sh /home/node/app/.docker/start.sh

# Mude para o usuário root temporariamente para alterar permissões
USER root
RUN chmod +x /home/node/app/.docker/start.sh

# Mude de volta para o usuário 'node'
USER node

# Defina o comando padrão para iniciar o contêiner
CMD ["/bin/bash", "/home/node/app/.docker/start.sh"]
