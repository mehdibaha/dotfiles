import re
import subprocess

# Get process info
ps = subprocess.Popen(['ps', '-caxm', '-orss,comm'], stdout=subprocess.PIPE).communicate()[0].decode()
vm = subprocess.Popen(['vm_stat'], stdout=subprocess.PIPE).communicate()[0].decode()

def getPsStats(ps):
    # Iterate processes
    sep = re.compile('[\s]+')
    data = ps.split('\n')
    
    data = [sep.split(row.strip()) for row in data]
    stats = 0
    for row in data:
        try:
            stats += float(row[0])
        except:
            pass
    stats /= 1024**2
    return round(stats, 2)

def getVmStats(vm):
    # Process vm_stat
    sep = re.compile(':[\s]+')
    vmLines = vm.split('\n')
    vmStats = {}
    for row in range(1,len(vmLines)-2):
        rowText = vmLines[row].strip()
        rowElements = sep.split(rowText)
        k, v = rowElements[:2]
        vmStats[k] = int(v.strip('\.')) * (4 / 1024)
        vmStats[k] = int(vmStats[k])
    return vmStats

stats = getVmStats(vm)
stats["Total memory"] = getPsStats(ps)

print(f'Wired Memory\t {stats["Pages wired down"]} MB')
print(f'Active Memory\t {stats["Pages active"]} MB')
print(f'Inactive Memory\t {stats["Pages inactive"]} MB')
print(f'Free Memory\t {stats["Pages free"]} MB')
print(f'Real Mem Total\t {stats["Total memory"]} GB')
