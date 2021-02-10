#Deploy Cisco AnyConnect Umbrella OrgInfo.JSON File

Description
This script creates the OrgInfo.JSON file in C:\ProgramData\Cisco\Cisco AnyConnect Secure Mobility Client\Umbrella\ and writes your company specific JSON data into it. This configues Cisco AnyConnect Umbrella Module with your Organisations details. You will need to download the OrgInfo.JSON from your Cisco Umbrella portal and post the details into the script to make it work. 

Requirements

- Cisco AnyConnect Umbrella Module Installed 
    This is important as it creates the folder where the powershell script will place the JSON file. Set the INTUNEWIN App to have a dependancy on Cisco AnyConnect Umbrella Module to be installed first.

- OrgInfo.JSON
    To get the OrgInfo.JSON follow the following:

1. Navigate to Deployments > Roaming Computers and click Roaming Client.

https://files.readme.io/4d89491-click_rc.jpg

2. Under AnyConnect Umbrella Roaming Security Module, click Download Module Profile and download the OrgInfo.json file.

Depending on your system, drop the file into:
Windows: %ProgramData%\Cisco\Cisco AnyConnect Secure Mobility Client\Umbrella\
or
Mac: /opt/cisco/anyconnect/Umbrella/
Note: You must create this folder structure.

https://files.readme.io/85931bb-download_module_profile.jpg

But you do not need to drop the file. You just need to copy its contents into the powershell script, convert it into an INTUNEWIN file and deploy it.

How to deploy a script as a INTUNEWIN File: LINK HERE

Install Switch: PowerShell.exe -ExecutionPolicy Bypass -File DeployCiscoAnyConnectUmbrellaJSON.ps1
Uninstall Switch: PowerShell.exe -ExecutionPolicy Bypass -File DeployCiscoAnyConnectUmbrellaJSON.ps1 (Not Used)

Detection Method: Manually Configured File or Folder
For detection the use the following path: 'C:\temp\powershell\scriptdetection\'
File for detection: 'umbrellaprofile.txt'
Detect if file or folder exists.

Issues: 
Script will fail to execute if Cisco Anyconnect and Cisco AnyConnect Umbrella Agent is not installed. 
Script will not run if it detects the umbrellaprofile.txt document in the C:\temp\powershell\scriptdetection\ folder.

Notes: 
You may note all scripts use the C:\temp\powershell\scriptdetection\ detection mode. This is by design incase an OrgInfo.JSON is preexisting. You could use the OrgInfo.JSON file as its own detection mode if deploying onto new devices only. 

Detection Method: Manually Configured File or Folder
For detection the use the following path: C:\ProgramData\Cisco\Cisco AnyConnect Secure Mobility Client\Umbrella\
File for detection: OrgInfo.JSON
Detect if file or folder exists.

Should you wish to overwrite an existing OrgInfo.JSON the script will need to be modified as currently if it detects a file it will exit. Delete everything up to the $path and add the following:

New-Item $filepath -ItemType File
Set-Content $filepath '{
    "organizationId" : "ENTER ORG NUMBER HERE",
    "fingerprint" : "ENTER YOUR FINGERPRINT ID",
    "userId" : "ENTER USER ID"
}'

---------------------------------------------------

#Deploy Cisco AnyConnect VPN Profile File

Description
This script creates the VPN_Profile.xml file in C:\ProgramData\Cisco\Cisco AnyConnect Secure Mobility Client\Profile\ and writes your company specific XML data into it. This configues Cisco AnyConnect Umbrella Module with your Organisations details. You will need to create the XML file or modify the script with your company details. 

Requirements

- Cisco AnyConnect VPN Installed 
    This is important as it creates the folder where the powershell script will place the XML file. Set the INTUNEWIN App to have a dependancy on Cisco AnyConnect VPN Module to be installed first.

How to deploy a script as a INTUNEWIN File: LINK HERE

Install Switch: PowerShell.exe -ExecutionPolicy Bypass -File DeployCiscoAnyConnectVPNProfile.ps1
Uninstall Switch: PowerShell.exe -ExecutionPolicy Bypass -File DeployCiscoAnyConnectVPNProfile.ps1 (Not Used)

Detection Method: Manually Configured File or Folder
For detection the use the following path: 'C:\temp\powershell\scriptdetection\'
File for detection: 'umbrellaprofile.txt'
Detect if file or folder exists.

Issues: 
Script will fail to execute if Cisco Anyconnect and Cisco AnyConnect Umbrella Agent is not installed. 
Script will not run if it detects the umbrellaprofile.txt document in the C:\temp\powershell\scriptdetection\ folder.

Notes: 
You may note all scripts use the C:\temp\powershell\scriptdetection\ detection mode. This is by design incase a VPN Profile by the same name is preexisting. You could use the XML file as its own detection mode if deploying onto new devices only. 

Detection Method: Manually Configured File or Folder
For detection the use the following path: C:\ProgramData\Cisco\Cisco AnyConnect Secure Mobility Client\Profile\
File for detection: VPN_Profile.xml
Detect if file or folder exists.