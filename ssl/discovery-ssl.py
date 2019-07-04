#!/usr/bin/python
import json
import sys

ARQUIVO = sys.argv[1]
ARQUIVO_OUTPUT_JSON = sys.argv[2]
data = {}
data['data'] = []


f = open(ARQUIVO, "r")
for I in f:
    data['data'].append({
    '{#SERVERNAME}': I.replace('\n',''),
    })

#json.dump(data, sys.stdout)
#json.dump(data, sys.stdout, indent=4)
with open(ARQUIVO_OUTPUT_JSON, 'w') as outfile:
    json.dump(data, outfile)
#print(data)
