import socket
import uuid
import os
import re

def sendScript(port, scriptContent):
	magic = str(uuid.uuid4())
	with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
		sock.connect(('127.0.0.1', port))
		sock.recv(1024)
		sock.send(scriptContent.encode())
		sock.send(b'\necho ' + magic.encode() + b'\n')
		data = ''
		while True:
			data += sock.recv(1024*3).decode(errors='ignore')
			if magic in data:
				break
		print(data)
		sock.close()

for folder in ['Spine', 'Leafs', 'Host', 'Test']:
	for scriptFile in os.listdir(folder):
		scriptContent = open(f'{folder}/{scriptFile}', 'r').read()
		port = int(re.findall(r'#([0-9]{4})', scriptContent)[0])
		print("#=====================================#")
		print(f"# Hostname: {scriptFile}    Port: {port}")
		print("#=====================================#")
		sendScript(port, scriptContent)