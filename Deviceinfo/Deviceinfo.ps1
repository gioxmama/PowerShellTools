#Author:      gioxmama#5021
#Date:        04.10.2022
#Description: This script is only going to work if a disk D: is present.
#             This script is only going to catch important info about your device by:
#             Grabbing the serial number, making a battery report(laptop only) and getting a msinfo32 export done
#             After that is going to move all that stuff on the disk D: in a directory called like your hostname.


$hostname= hostname
$reporttest = Test-Path -Path D:\report.nfo
wmic bios get serialnumber | Out-File D:\Serial-Number.txt
powercfg /batteryreport /output "D:\battery_report.html"
MSInfo32 /nfo D:\report.nfo
Get-Date | Out-File D:\1-Date.txt
New-Item D:\$hostname -itemtype Directory
Move-Item -Path D:\Serial-Number.txt -Destination D:\$hostname\Serial-Number.txt
Move-Item -Path D:\battery_report.html -Destination D:\$hostname\battery_report.html
Move-Item -Path D:\1-Date.txt -Destination D:\$hostname\1-Date.txt
do{
sleep 8
$reporttest = Test-Path -Path D:\report.nfo
} until($reporttest -eq "True")
Move-Item -Path D:\report.nfo -Destination D:\$hostname\report.nfo