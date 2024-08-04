FROM node:21.6.0-alpine3.18

# Instalar dependências
RUN apk add --no-cache \
    zsh \
    git \
    curl \
    fontconfig \
    && apk add --no-cache --virtual .build-deps \
    font-util \
    font-misc-misc \
    && apk add --no-cache \
    ttf-dejavu \
    && apk del .build-deps

# Instalar Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instalar o tema Spaceship e fontes Powerline
RUN git clone https://github.com/denysdovhan/spaceship-prompt.git $ZSH/themes/spaceship-prompt \
    && ln -s $ZSH/themes/spaceship-prompt/spaceship.zsh-theme $ZSH/themes/spaceship.zsh-theme \
    && git clone https://github.com/powerline/fonts.git --depth=1 \
    && cd fonts \
    && ./install.sh \
    && cd .. \
    && rm -rf fonts

# Copiar o arquivo de configuração do zsh
COPY .docker/.zshrc /home/node/.zshrc

# Definir o diretório de trabalho
WORKDIR /home/node/app

# Copiar o script start.sh para o contêiner
COPY .docker/start.sh /home/node/app/.docker/start.sh

# Mudar para o usuário root temporariamente para alterar permissões
USER root
RUN chmod +x /home/node/app/.docker/start.sh

# Mudar de volta para o usuário 'node'
USER node

# Definir o comando padrão para iniciar o contêiner
CMD ["/home/node/app/.docker/start.sh"]
