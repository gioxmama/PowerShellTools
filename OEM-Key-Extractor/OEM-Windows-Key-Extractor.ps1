#Author:      gioxmama#5021
#Date:        04.10.2022
#Description: This script is going to help you pulling out OEM-Key information
#             directly out of the BIOS and saving them as .txt data on a USB
#             device.
#             !!ATTENTION!! The USB-device needs to be a disk D:


$hostname= hostname
$Pathtest = Test-Path -Path D:\

do{
echo Disk D: is needed... No disk D detected... Connect the disk D: and wait...
sleep 5
$Pathtest = Test-Path -Path D:\
} until($Pathtest -eq "True")

$Continuitypath = Test-Path - Path D:\OEM-Keys

while($Continuitypath -eq "False")
{
New-Item D:\OEM-Keys -itemtype Directory
sleep 1
$Continuitypath = Test-Path - Path D:\OEM-Keys
}

(Get-WmiObject -Query ‘select * from SoftwareLicensingService’).OA3xOriginalProductKey | Out-File D:\OEM-Windows-Licence.txt
Get-Date | Out-File D:\1-Date.txt
New-Item D:\OEM-Keys\$hostname -itemtype Directory
Move-Item -Path D:\OEM-Windows-Licence.txt -Destination D:\OEM-Keys\$hostname\OEM-Windows-Licence.txt
Move-Item -Path D:\1-Date.txt -Destination D:\OEM-Keys\$hostname\1-Date.txt