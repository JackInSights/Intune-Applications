# Description
# User this script at your own risk. If there does exist a AzureAD tenant with the company.com domain they will have access to your local compueters.

net localgroup administrators /add "AzureAD\user@company.com"
net localgroup administrators /add "AzureAD\user@company.com"
net user username "Random8eg9PUO0l" /add /passwordchg:no /logonpasswordchg:no
net localgroup administrators /add username