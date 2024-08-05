#!/bin/bash

if ! npm install; then
  echo "npm install falhou"
  exit 1
fi

echo "npm install concluído com sucesso. Mantendo o contêiner em execução..."
tail -f /dev/null
