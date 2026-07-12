from controller import Robot
import socket
import select

TIME_STEP = 32
robot = Robot()

leftMotor = robot.getDevice('left wheel')
rightMotor = robot.getDevice('right wheel')

leftMotor.setPosition(float('inf'))
rightMotor.setPosition(float('inf'))

def forward():
    leftMotor.setVelocity(4.0)
    rightMotor.setVelocity(4.0)

def backward():
    leftMotor.setVelocity(-4.0)
    rightMotor.setVelocity(-4.0)

def stop():
    leftMotor.setVelocity(0.0)
    rightMotor.setVelocity(0.0)

stop()

server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.bind(('127.0.0.1', 65432))
server_socket.listen(1)

print("--- Webots Controller Ready ---")
print("Waiting for RISC-V commands on port 65432...")

conn = None

while robot.step(TIME_STEP) != -1:
    if conn is None:
        readable, _, _ = select.select([server_socket], [], [], 0)
        if readable:
            conn, addr = server_socket.accept()
            print("Connected to RISC-V Bridge!")

    else:
        readable, _, _ = select.select([conn], [], [], 0)
        if readable:
            try:
                data = conn.recv(1024)
                if not data:
                    conn = None
                    continue

                command = data.decode('utf-8').strip()
                print(f"Received from RISC-V: {command}")
                
                if "FORWARD" in command:
                    forward()
                elif "BACKWARD" in command:
                    backward()
                elif "STOP" in command:
                    stop()
                    
            except Exception as e:
                conn = None