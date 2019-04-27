echo "Enabling smb1"

#Enable SMB1 protocol to workaround Windows on-demand issues
Enable-WindowsOptionalFeature -Online -FeatureName smb1protocol -NoRestart 
Set-SmbServerConfiguration -EnableSMB1Protocol $true -Confirm:$true -Force #may work on 2012 but not 2019
set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters SMB1 -Type DWORD -Value 1 -Force
#Just in case firewall really didn't get disabled
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

echo "restarting lanman"
Restart-Service lanmanserver