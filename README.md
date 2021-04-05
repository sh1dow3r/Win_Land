# Win_Land

Ansible Script for Windows Server config. Mainly for homelab usage.

## How to use:

Make sure you can reach your windows via winrm, if you can't run it, go to `files > ConfigureRemotingForAnsible.ps1` and run it in powershell. 

After that modify inventory.ini and run the playbook as follows.. 
`ansible-playbook site.yml -i inventory.ini`
