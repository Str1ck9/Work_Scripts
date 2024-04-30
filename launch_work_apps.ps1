#
# Script to launch the apps I use for work without entering my credentials
# over and over again. It would be nice to be able to have the apps launch
# in a virtual desktop (I have 3), but that is not supported AFAIK
#

# Get Admin creds and store them
$credentials = Get-Credential -Message "Please enter DT Credentials: "
 
# Launch Chrome as regular user
Start-Process "C:\Program Files\Google\Chrome\Application\Chrome.exe"
 
# Launch email client (Outlook, for example) as regular user
Start-Process "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"
 
# Launch ADUC with admin credentials directly in an elevated PowerShell if required
Start-Process "powershell" -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"Start-Process dsa.msc -Verb RunAs`"" -Credential $credentials

# Launch Group Policy Editor the same way
Start-Process "powershell" -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"Start-Process gpedit.msc -Verb RunAs`"" -Credential $credentials
 
# Launch MECM Configuration Manager as admin
# Note: Update the path to where your MECM executable is located
Start-Process "C:\Program Files (x86)\Microsoft Endpoint Manager\AdminConsole\bin\Microsoft.ConfigurationManagement.exe" -Credential $credentials
 
# Launch PowerShell ISE as admin
Start-Process "powershell" -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"Start-Process powershell_ise.exe -Verb RunAs`"" -Credential $credentials
