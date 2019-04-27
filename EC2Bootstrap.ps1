<powershell>

# WinRM
write-output "Setting up WinRM"
write-host "(host) setting up WinRM"

cmd.exe /c winrm quickconfig -q
cmd.exe /c winrm quickconfig '-transport:http'
cmd.exe /c winrm set "winrm/config" '@{MaxTimeoutms="1800000"}'
cmd.exe /c winrm set "winrm/config/winrs" '@{MaxMemoryPerShellMB="1024"}'
cmd.exe /c winrm set "winrm/config/service" '@{AllowUnencrypted="true"}'
cmd.exe /c winrm set "winrm/config/client" '@{AllowUnencrypted="true"}'
cmd.exe /c winrm set "winrm/config/service/auth" '@{Basic="true"}'
cmd.exe /c winrm set "winrm/config/client/auth" '@{Basic="true"}'
cmd.exe /c winrm set "winrm/config/listener?Address=*+Transport=HTTP" '@{Port="5985"}'
#unhash below to configure windows firewall
#cmd.exe /c netsh advfirewall firewall set rule group="remote administration-winrm" new enable=yes
#cmd.exe /c netsh firewall add portopening TCP 5985 "Port 5985"
#cmd.exe /c netsh advfirewall firewall set rule group="remote administration-smb" new enable=yes
#cmd.exe /c netsh firewall add portopening TCP 445 "Port 445"
cmd.exe /c netsh advfirewall set allprofiles state off #turns off firewall
cmd.exe /c net stop winrm
cmd.exe /c sc config winrm start= auto
cmd.exe /c net start winrm
</powershell>

