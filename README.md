# Win_Land

Ansible Script for Windows Server config. Mainly for homelab usage.

## How to use:

Make sure you can reach your windows via winrm, if you can't run it, go to `files > ConfigureRemotingForAnsible.ps1` and run it in powershell. 

After that modify the inventory.ini and vars.yml. 

## How to run the playbook 
`ansible-playbook site.yml -i inventory.ini`
