# VDOM types counter

This script is used to count VDOM types that is used in an applications.

## Dependencies
The python script requires the `openpyxl` library for Excel file operations.


## Main Script

The main script is `count_types.sh` and expects two arguments:

1. Path to the types directory.
2. Path to the compiled apps directory.

**Usage**:

`./count_types.sh <path_to_types_directory> <path_to_compiled_apps_directory>`

The script first checks if the correct number of arguments are provided. It then delegates tasks to other scripts, namely `process_types.sh`, `pattern_search.sh`, and `types_report.py`.

## process_types.sh

This script is designed to traverse a specified directory, searching for files named type.xml. For each type.xml file found, the script extracts the value within the `<Name>` tag and associates it with the name of the containing folder - **type guid**. The final output is a JSON representation of the folder names and their corresponding `<Name>` values from the type.xml files.

**Usage**:

`bash ./process_types.sh <path_to_types_directory>`

## pattern_search.sh
This script is tailored to search through XML files within a specified directory, looking for matches based on a provided grep pattern using RegEx. For each XML file, the script displays the filename (deleting "_compiled.xml" suffix) followed by unique matches of the pattern.

**Usage**:

`bash ./pattern_search.sh <path_to_compiled_apps_directory> '<grep pattern using RegEx>`

## types_report.py

This Python script generates a report based on the outputs of the previous scripts. Simply run it after the main script to get the report. Once executed, it will generate an Excel file named report.xlsx in the same directory.

**Usage**:

`python types_report.py`
