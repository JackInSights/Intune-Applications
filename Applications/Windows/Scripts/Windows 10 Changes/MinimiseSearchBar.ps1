New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Value "1" -PropertyType DWORD -Force
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowCortanaButton" -Value "0" -PropertyType DWORD -Force

$path = 'C:\temp\powershell\scriptdetection'
$file = 'C:\temp\powershell\scriptdetection\removesearchbar.txt'

if ( Test-Path -Path $path -PathType Container ) { New-Item -Path 'C:\temp\powershell\scriptdetection\removesearchbar.txt' -ItemType File } else { mkdir $path }

if (-not(Test-Path -Path $file -PathType Leaf)) {
     try {
         $null = New-Item -ItemType File -Path $file -Force -ErrorAction Stop
         Write-Host "The file [$file] has been created."
     }
     catch {
         throw $_.Exception.Message
     }
 } else {
     Write-Host "File already exists"
 }