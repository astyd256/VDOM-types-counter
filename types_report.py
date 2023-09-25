import json

import json
import openpyxl

# Загрузка данных из types.txt
with open("types.txt", "r") as f:
    types_dict = json.load(f)

# Загрузка данных из used_types.txt
with open("used_types.txt", "r") as f:
    lines = f.readlines()

# Dividing by blocks
apps_data = []
app_block = []
for line in lines:
    line = line.strip()
    if line == "-------------------------":
        apps_data.append(app_block)
        app_block = []
    else:
        app_block.append(line)
if app_block:
    apps_data.append(app_block)

# Creating new Excel book
wb = openpyxl.Workbook()
ws = wb.active

# Filing table with data
col = 1
for app_block in apps_data:
    app_name = app_block[0]
    ws.cell(row=1, column=col, value=app_name)
    for idx, guid in enumerate(app_block[1:], start=2):
        type_name = types_dict.get(guid, "Unknown")
        ws.cell(row=idx, column=col, value=type_name)
    col += 2  # Skip one column

# Saving report
wb.save("report.xlsx")

