#!/usr/bin/env python

import subprocess
import re

# Get process info
vm = subprocess.Popen(['vm_stat'], stdout=subprocess.PIPE).communicate()[0]

# Process vm_stat
vmLines = vm.split('\n')
sep = re.compile(':[\s]+')
vmStats = {}
for row in range(1,len(vmLines)-2):
    rowText = vmLines[row].strip()
    rowElements = sep.split(rowText)
    vmStats[(rowElements[0])] = int(rowElements[1].strip('\.')) * 4096

active=vmStats["Pages active"]/1024/1024
wired=vmStats["Pages wired down"]/1024/1024
compressed=vmStats["Pages stored in compressor"]/1024/1024

print 'Active Memory:\t\t',active,'MB'
print 'Wired Memory:\t\t',wired,'MB'
print 'Compressed Memory:\t',compressed,'MB'
print '\t\t\t-------'
print 'Used memory:\t\t',active+wired+compressed,'MB'
print '- - - - - - - - - - - -'
print 'Inactive Memory:\t%d MB' % ( vmStats["Pages inactive"]/1024/1024 )
print 'Swap Used:\t\t%d MB' % ( vmStats["Swapins"]/1024/1024 )
print 'Free Memory:\t\t%d MB' % ( vmStats["Pages free"]/1024/1024 )
