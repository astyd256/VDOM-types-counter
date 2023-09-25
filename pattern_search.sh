#!/bin/bash

# Checking given arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <path_to_directory> <grep pattern using RegEx>"
    exit 1
fi

DIRECTORY="$1"
PATTERN="$2"

# Checking directory for existance
if [ ! -d "$DIRECTORY" ]; then
    echo "Error: Directory $DIRECTORY does not exist."
    exit 1
fi

# Проход по каждому XML файлу в директории
for file in "$DIRECTORY"/*.xml; do
    filename=$(basename "$file" "_compiled.xml")
    echo "$filename"
    # Using grep for guid searching
    grep -oP "$2" "$file" | sort -u
    echo "-------------------------"
done
