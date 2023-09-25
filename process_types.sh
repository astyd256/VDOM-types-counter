#!/bin/bash

# Checking given arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path_to_directory>"
    exit 1
fi

DIRECTORY="$1"

# Checking directory for existance
if [ ! -d "$DIRECTORY" ]; then
    echo "Error: Directory $DIRECTORY does not exist."
    exit 1
fi

declare -A results

# Checking every directory for file named type.xml 
while IFS= read -r -d '' file; do
    folder_name=$(basename "$(dirname "$file")")
    name_value=$(grep -oPm1 '<Name>\K[^<]+' "$file")
    results["$folder_name"]=$name_value
done < <(find "$DIRECTORY" -type f -name "type.xml" -print0)

# Results in JSON format
echo "{"
first=true
for key in "${!results[@]}"; do
    if [ "$first" = true ]; then
        first=false
    else
        echo ","
    fi
    echo -n "  \"$key\": \"${results[$key]}\""
done
echo
echo "}"
