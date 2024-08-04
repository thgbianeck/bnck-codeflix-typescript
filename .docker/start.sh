#!/bin/bash

# Navegar para o diretório da aplicação e instalar dependências
cd /home/node/app/bnck-admin-catalogo-ts || { echo "Diretório não encontrado"; exit 1; }

if ! npm install; then
  echo "npm install falhou"
  exit 1
fi

echo "npm install concluído com sucesso. Mantendo o contêiner em execução..."
tail -f /dev/null
