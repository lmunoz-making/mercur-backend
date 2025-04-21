#!/bin/sh

if [ ! -f /app/db_initialized.txt ]; then
  echo "Ejecutando migraciones por primera vez..."

  # Ejecutar las migraciones
  yarn workspace api medusa db:create
  yarn workspace api medusa db:migrate
  yarn workspace api seed
  npx medusa user --email admin@making.cl --password making2025*
  
  touch /app/db_initialized.txt
else
  echo "Base de datos ya inicializada. Saltando migraciones."
fi

yarn workspace api start