#!/bin/bash

# Define variables
SOURCE_DIR="/home/Marie/StudentsRecords"  # Change to the actual directory path
BACKUP_DIR="/backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/student_records_backup_$TIMESTAMP.tar.gz"

# Ensure the backup directory exists
mkdir -p "$BACKUP_DIR"

# Check if the Student Records directory exists
if [ -d "$SOURCE_DIR" ]; then
    # Create a compressed archive
    tar -czf "$BACKUP_FILE" "$SOURCE_DIR"

    # Check if the backup was successful
    if [ $? -eq 0 ]; then
        echo "Backup successful! File saved at: $BACKUP_FILE"
    else
        echo "Backup failed!"
    fi
else
    echo "Error: Student Records directory does not exist!"
fi





