# Description:
# This script creates detects if OrgInfo.JSON exists. If it does not it will create it and write your Org data to it. 
# It then creates a file in C:\temp\powershell\scriptdetection to allow Intune to track installation.

$condition = Test-Path -LiteralPath "C:\ProgramData\Cisco\Cisco AnyConnect Secure Mobility Client\Umbrella\OrgInfo.json"
$filepath = "C:\ProgramData\Cisco\Cisco AnyConnect Secure Mobility Client\Umbrella\OrgInfo.json"

if ($condition) {
Write-host("File exists. Exiting")

} else {New-Item $filepath -ItemType File
Set-Content $filepath '{
    "organizationId" : "ENTER ORG NUMBER HERE",
    "fingerprint" : "ENTER YOUR FINGERPRINT ID",
    "userId" : "ENTER USER ID"
}'}

$path = 'C:\temp\powershell\scriptdetection'
$file = 'C:\temp\powershell\scriptdetection\umbrellaprofile.txt'

if ( Test-Path -Path $path -PathType Container ) { New-Item -Path $file -ItemType File } else { mkdir $path }

if (-not(Test-Path -Path $file -PathType Leaf)) {
     try {
         $null = New-Item -ItemType File -Path $file -Force -ErrorAction Stop
         Write-Host "The file [$file] has been created."
     }
     catch {
         throw $_.Exception.Message
     }
 } else {
     Write-Host "Cannot create [$file] because a file with that name already exists."
 }