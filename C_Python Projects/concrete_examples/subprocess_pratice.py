import subprocess
# subprocess how python lanuches another program 
result = subprocess.run(
    ["some_simulator", "design.v"],
    capture_output = True,
    text = True
)

print(result.stdout)



