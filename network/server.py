#Network

import socket

# 서버 소켓 준비
server = socket.socket()
server.bind(('192.168.0.10', 9999))
server.listen(1)
print('----- The server is ready -----')

# 클라이언트 접속 수락
client, addr = server.accept()
print('----- Client is connected -----')

# 메시지 수신
msg = client.recv(1024)
print('----- Message received -----')
print(msg)

# 메시지 송신
client.sendall(b'Hi Hi iW'm server, you message is \'' + msg + b)
print('----- Message send -----')

# 해제
client.close()
server.close()

