import socket
import subprocess
import os
import time

#configuration_path
RARS_JAR = r"E:\msme_project_1\simulation\rars1_6.jar"
ASM_FILE = r"E:\msme_project_1\simulation\controller.asm"
MODELSIM_DIR = r"B:\intelFPGA\18.1\modelsim_ase\win32aloem"
VERILOG_FOLDER = r"E:\msme_project_1\simulation"
TOP_TESTBENCH = "network_rom_tb"

vlib_cmd = os.path.join(MODELSIM_DIR, "vlib.exe")
vlog_cmd = os.path.join(MODELSIM_DIR, "vlog.exe")
vsim_cmd = os.path.join(MODELSIM_DIR, "vsim.exe")
tb_file_path = os.path.join(VERILOG_FOLDER, f"{TOP_TESTBENCH}.v")

#webots_connection_part
print("Connecting to Webots...")
client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
try:
    client.connect(('127.0.0.1', 65432))
    print("Connected to Webots successfully!")
except ConnectionRefusedError:
    print("Error: Webots is not running. Start the Webots simulation first!")
    exit()

print(f"\n[AUTO-WATCHER STARTED] Monitoring '{TOP_TESTBENCH}.v' for changes...")
print("Keep this window open in the background. Just save your Verilog file to trigger the robot!\n")

#last modified timestamp of the file
last_modified = os.path.getmtime(tb_file_path)

try:
    while True:
        current_modified = os.path.getmtime(tb_file_path)

        if current_modified != last_modified:
            last_modified = current_modified

            print("\n" + "=" * 50)
            print("FILE SAVE DETECTED! RUNNING PIPELINE...")
            print("=" * 50)

            if not os.path.exists(os.path.join(VERILOG_FOLDER, "work")):
                subprocess.run([vlib_cmd, "work"], cwd=VERILOG_FOLDER, capture_output=True)

            compile_process = subprocess.run(
                f'"{vlog_cmd}" *.v',
                shell=True,
                cwd=VERILOG_FOLDER,
                capture_output=True,
                text=True
            )

            if compile_process.returncode != 0:
                print(f"ModelSim Compilation Error:\n{compile_process.stderr}")
                continue

            v_process = subprocess.Popen(
                [vsim_cmd, "-c", "-do", "run -all; quit", f"work.{TOP_TESTBENCH}"],
                cwd=VERILOG_FOLDER,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True
            )

            v_out, _ = v_process.communicate()

            shape_id = "3"
            shape_id = "1"

            if "PREDICTED SHAPE = CIRCLE" in v_out:
                print("-> Target Identified: CIRCLE")
                shape_id = "2"
            elif "PREDICTED SHAPE = SQUARE" in v_out:
                print("-> Target Identified: SQUARE")
                shape_id = "1"
            elif "PREDICTED SHAPE = TRIANGLE" in v_out:
                print("-> Target Identified: TRIANGLE")
                shape_id = "3"

            print(f"Passing Shape ID '{shape_id}' into RISC-V SoC Architecture...")

            r_process = subprocess.Popen(
                ['java', '-jar', RARS_JAR, 'nc', ASM_FILE],
                stdin=subprocess.PIPE,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True
            )

            r_stdout, _ = r_process.communicate(input=shape_id + '\n')

            print("Routing RISC-V Decision to Webots Actuators...")

            if "FORWARD" in r_stdout:
                print(">>> Action: forward")
                client.sendall(b"FORWARD")
            elif "BACKWARD" in r_stdout:
                print(">>> Action: backward")
                client.sendall(b"BACKWARD")
            else:
                print(">>> Action: stop")
                client.sendall(b"STOP")

            print("=" * 50)
            print("waiting for next file save...")

        time.sleep(1)

except KeyboardInterrupt:
    print("\nStopping Auto-Watcher...")
    client.close()
