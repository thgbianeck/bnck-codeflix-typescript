FROM node:21.6.0-alpine3.18

# Definir o diretório de trabalho
WORKDIR /home/node/app

# Copia o arquivo package.json e package-lock.json
COPY package*.json ./

# Instala as dependências
RUN npm install

# Copia o restante do código do projeto
COPY . .

# Definir o comando padrão para iniciar o contêiner
CMD ["tail", "-f", "/dev/null"]