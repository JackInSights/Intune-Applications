function DoUnpin([string]$appname){
    $ErrorActionPreference= 'silentlycontinue'
    ((New-Object -Com Shell.Application).NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | Where-Object {$_.Name -eq $appname}).Verbs() | Where-Object {$_.Name.replace('&','') -match 'Unpin from taskbar'} | ForEach-Object {$_.DoIt();}
    $ErrorActionPreference= 'continue'
}

function DoPin([string]$appname){
    if((Get-Process explorer).count -eq 1){
        Write-Host "Not running as explorer.exe! cannot pin to taskbar!"
        return
    }
    $ErrorActionPreference= 'silentlycontinue'
    ((New-Object -Com Shell.Application).NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | Where-Object {$_.Name -eq $appname}).Verbs() | Where-Object {$_.Name.replace('&','') -match 'Pin to Taskbar'} |  ForEach-Object {$_.DoIt();}
    $ErrorActionPreference= 'continue'
}

DoUnpin "Microsoft Store"
DoUnpin "Mail"

DoPin "Word 2016"
DoPin "Excel 2016"
DoPin "Outlook 2016"

$path = 'C:\temp\powershell\scriptdetection'
$file = 'C:\temp\powershell\scriptdetection\pinnedapplications.txt'

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