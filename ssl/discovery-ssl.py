#!/usr/bin/python
# Desenvolvido por Antonio Novaes e Alan Queiroz
import json
import sys

ARQUIVO = sys.argv[1]
data = {}
data['data'] = []


f = open(ARQUIVO, "r")
for I in f:
    data['data'].append({
    '{#SERVERNAME}': I.replace('\n',''),
    })

#json.dump(data, sys.stdout)
#json.dump(data, sys.stdout, indent=4)
with open('/tmp/data.txt', 'w') as outfile:
    json.dump(data, outfile)
#print(data)
