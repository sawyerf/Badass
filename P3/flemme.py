import socket
import uuid
import os
import re

def sendScript(port, scriptContent):
	magic = str(uuid.uuid4())
	with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
		sock.connect(('127.0.0.1', port))
		sock.send(scriptContent.encode())
		sock.send(b'\necho ' + magic.encode())
		while True:
			data = sock.recv(1024*10).decode(errors='ignore')
			print(data)
			if magic in data:
				break

for folder in ['Host', 'Leafs', 'Spine']:
	for scriptFile in os.listdir(folder):
		scriptContent = open(f'{folder}/{scriptFile}', 'r').read()
		port = int(re.findall(r'#([0-9]{4})', scriptContent)[0])
		print("#=====================================#")
		print(f"# Hostname: {scriptFile}    Port: {port}")
		print("#=====================================#")
		sendScript(port, scriptContent)