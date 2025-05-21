#!/bin/bash
# Carpeta del sitio Wordpress
WORDPRESS_DIR="/home/debian/wordpress"

# Carpetas donde se guardaran las copias
BACKUP_DIR="/home/debian/backup"

# Fecha actual
FECHA=$(date +'%Y-%m-%d_%H-%M')

# Nombre del archivo comprimido
BACKUP_NAME="wordpress_backup_$FECHA.tar.gz"

# Base de datos
DB_NAME="wordpress_db"
DB_USER="wordpress_user"
DB_PASS="wordpressSuperSecurePassword"

ARCHIVO_BACKUP="$BACKUP_DIR/backup-wordpress-$FECHA.tar.gz"

# Crea la carpeta de backups
mkdir -p $BACKUP_DIR
# Copia archivos de wordpress
cp -r $WORDPRESS_DIR $BACKUP_DIR/wordpress_files_$FECHA

# Hacer respaldo de la base de datos
sudo mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_DIR/db_backup_$FECHA.sql

# Comprimir todo
tar -czf $BACKUP_DIR/$BACKUP-NAME -C $BACKUP_DIR wordpress_files_$FECHA db_backup_$FECHA.sql

# Borrar archivos sueltos despues de comprimir
rm -r $BACKUP_DIR/wordpress_files_$FECHA
rm $BACKUP_DIR/db_backup_$FECHA.sql

echo "backup completado y guardado en $BACKUP_DIR/$BACKUP_NAME"
cp -r /home/debian/wordpress $BACKUP_DIR/wordpress_$FECHA
