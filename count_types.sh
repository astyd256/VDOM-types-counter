#!/bin/bash

# Checking given arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <path_to_types_directory> <path_co_compiled_apps_directory>"
    exit 1
fi 

TYPES_DIRECTORY="$1"
APPS_DIRECTORY="$2"

bash ./process_types.sh "$1" > "types.txt"
bash ./pattenr_search.sh "$2" '<Object Type="\K[a-f0-9\-]+' > "used_types.txt"
python types_report.py