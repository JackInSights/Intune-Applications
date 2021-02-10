# Description:
# This script creates detects if VPN_Profile.xml exists. If it does not it will create it and write your Org data to it. 
# It then creates a file in C:\temp\powershell\scriptdetection to allow Intune to track installation.

$condition = Test-Path -LiteralPath "C:\ProgramData\Cisco\Cisco AnyConnect Secure Mobility Client\Profile\VPN_Profile.xml"

if ($condition) {
Write-host("File exists.")

} else {New-Item "C:\ProgramData\Cisco\Cisco AnyConnect Secure Mobility Client\Profile\VPN_Profile.xml" -ItemType File
Set-Content "C:\ProgramData\Cisco\Cisco AnyConnect Secure Mobility Client\Profile\VPN_Profile.xml" '<?xml version="1.0" encoding="UTF-8"?>
<AnyConnectProfile xmlns="http://schemas.xmlsoap.org/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://schemas.xmlsoap.org/encoding/ AnyConnectProfile.xsd">
	<ClientInitialization>
		<UseStartBeforeLogon UserControllable="true">true</UseStartBeforeLogon>
		<AutomaticCertSelection UserControllable="true">true</AutomaticCertSelection>
		<ShowPreConnectMessage>false</ShowPreConnectMessage>
		<CertificateStore>All</CertificateStore>
		<CertificateStoreMac>All</CertificateStoreMac>
		<CertificateStoreOverride>false</CertificateStoreOverride>
		<ProxySettings>Native</ProxySettings>
		<AllowLocalProxyConnections>false</AllowLocalProxyConnections>
		<AuthenticationTimeout>30</AuthenticationTimeout>
		<AutoConnectOnStart UserControllable="true">false</AutoConnectOnStart>
		<MinimizeOnConnect UserControllable="true">true</MinimizeOnConnect>
		<LocalLanAccess UserControllable="true">true</LocalLanAccess>
		<DisableCaptivePortalDetection UserControllable="false">false</DisableCaptivePortalDetection>
		<ClearSmartcardPin UserControllable="true">true</ClearSmartcardPin>
		<IPProtocolSupport>IPv4,IPv6</IPProtocolSupport>
		<AutoReconnect UserControllable="true">true
			<AutoReconnectBehavior UserControllable="false">ReconnectAfterResume</AutoReconnectBehavior>
		</AutoReconnect>
		<SuspendOnConnectedStandby>false</SuspendOnConnectedStandby>
		<AutoUpdate UserControllable="false">true</AutoUpdate>
		<RSASecurIDIntegration UserControllable="false">Automatic</RSASecurIDIntegration>
		<WindowsLogonEnforcement>SingleLocalLogon</WindowsLogonEnforcement>
		<LinuxLogonEnforcement>SingleLocalLogon</LinuxLogonEnforcement>
		<WindowsVPNEstablishment>LocalUsersOnly</WindowsVPNEstablishment>
		<LinuxVPNEstablishment>LocalUsersOnly</LinuxVPNEstablishment>
		<AutomaticVPNPolicy>false</AutomaticVPNPolicy>
		<PPPExclusion UserControllable="false">Automatic
			<PPPExclusionServerIP UserControllable="false"></PPPExclusionServerIP>
		</PPPExclusion>
		<EnableScripting UserControllable="false">false</EnableScripting>
		<BackupServerList>
			<HostAddress>VPN ADDRESS/IP</HostAddress>
			<HostAddress>VPN ADDRESS/IP</HostAddress>
			<HostAddress>VPN ADDRESS/IP</HostAddress>
		</BackupServerList>
		<EnableAutomaticServerSelection UserControllable="true">false
			<AutoServerSelectionImprovement>20</AutoServerSelectionImprovement>
			<AutoServerSelectionSuspendTime>4</AutoServerSelectionSuspendTime>
		</EnableAutomaticServerSelection>
		<RetainVpnOnLogoff>false
		</RetainVpnOnLogoff>
		<CaptivePortalRemediationBrowserFailover>false</CaptivePortalRemediationBrowserFailover>
		<AllowManualHostInput>true</AllowManualHostInput>
	</ClientInitialization>
	<ServerList>
		<HostEntry>
			<HostName>WHAT YOU WANT TO CALL THE VPN</HostName>
			<HostAddress>VPN ADDRESS/IP</HostAddress>
			<BackupServerList>
				<HostAddress>VPN ADDRESS/IP</HostAddress>
				<HostAddress>VPN ADDRESS/IP</HostAddress>
				<HostAddress>VPN ADDRESS/IP</HostAddress>
			</BackupServerList>
		</HostEntry>
	</ServerList>
</AnyConnectProfile>
'}

$path = 'C:\temp\powershell\scriptdetection'
$file = 'C:\temp\powershell\scriptdetection\vpnprofile.txt'

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