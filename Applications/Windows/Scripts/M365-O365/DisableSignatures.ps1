New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Office\15.0\Common\MailSettings" -Name "DisableSignatures" -Value 1  -PropertyType "DWORD"
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Office\16.0\Common\MailSettings" -Name "DisableSignatures" -Value 1  -PropertyType "DWORD"