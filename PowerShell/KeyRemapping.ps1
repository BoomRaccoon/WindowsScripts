$Remap = New-Object -TypeName byte[] -ArgumentList 20 # the 20 byte long array that will be saved to the registry
# you have to input the bytes in little endian
# 1 key is made up of 2 bytes ex.: SCANCODE= '0xe0 0x53' but has to be '0x53 0xe0'
$Remap[8] = 2       # specifies the number of key remapping
$Remap[12] = 0x53   # key 1
$Remap[13] = 0xe0   # key 1
$Remap[14] = 0x52   # key 2
$Remap[15] = 0xe0   # key 2
$key = 'HKLM:\SYSTEM\CurrentControlSet\Control\Keyboard Layout'
New-ItemProperty -Path $key -Name 'ScanCode Map' -Value $Remap -Force