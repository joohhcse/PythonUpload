# client

import socket

# 서버 IP & port
ip = '192.168.0.10'
port = 9999

# 클라이언트 소켓 준비
client = socket.socket()

# 서버 접속
client.connect((ip, port))
print('----- The server is connected -----')

# 메시지 송신
client.send(b'Hello~ i\'m client')
print('----- Message send -----')

# 메시지 수신
msg = client.recv(1024)
print('----- Message received -----')
print(msg)

client.close()





