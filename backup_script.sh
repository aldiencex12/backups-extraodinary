#!/bin/bash

# Variabel lingkungan
DB_CONTAINER_NAME="exocbt_db"    # Nama kontainer PostgreSQL Anda
DB_USER="postgres"                 # Pengguna database
DB_NAME="exo"                      # Nama database
BACKUP_DIR="/home/www/backup"    # Lokasi untuk menyimpan backup
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")  # Format timestamp untuk nama file
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_backup_$TIMESTAMP.sql"  # Nama file backup

# Membuat direktori backup jika belum ada
mkdir -p $BACKUP_DIR

# Melakukan backup
docker exec $DB_CONTAINER_NAME pg_dump -U $DB_USER -d $DB_NAME > $BACKUP_FILE

# Menyimpan status backup
if [ $? -eq 0 ]; then
    echo "Backup berhasil: $BACKUP_FILE"
else
    echo "Backup gagal!"
fi

