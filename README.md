# ansible-windows-dc

Contains all roles related to the Windows Domain Controller

## Playbook

* vars.yml
  * Edit vars before run if needed
  * Edit Windows DC IP address for run
* inventory.ini
  * Edit Windows DC IP address for run

## Roles

* windows_utilities
  * Installs extras, unused
  * <https://docs.ansible.com/ansible/latest/modules/win_chocolatey_module.html>
* windows_ad_setup
  * Change hostname, install AD + DNS, and setup domain
  * <https://docs.ansible.com/ansible/latest/modules/win_hostname_module.html>
  * <https://docs.ansible.com/ansible/latest/modules/win_feature_module.html>
  * <https://docs.ansible.com/ansible/latest/modules/win_domain_module.html>
  * <https://docs.ansible.com/ansible/latest/modules/win_reboot_module.html>
  * <https://docs.ansible.com/ansible/latest/modules/win_domain_controller_module.html>
* windows_ad_groups
  * Adds all AD groups for vCenter usage
  * <https://docs.ansible.com/ansible/latest/modules/win_command_module.html>
  * <https://docs.ansible.com/ansible/latest/modules/win_domain_group_module.html>
  * <https://docs.ansible.com/ansible/latest/modules/win_domain_group_membership_module.html>
* windows_ad_users
  * Adds default users to AD and copies over student import powershell script
  * <https://docs.ansible.com/ansible/latest/modules/win_domain_user_module.html>
  * <https://docs.ansible.com/ansible/latest/modules/win_file_module.html>
* windows_dns_client
  * Sets DC all interface DNS settings
  * <https://docs.ansible.com/ansible/latest/modules/win_dns_client_module.html>
* windows_dns_record
  * Creates DNS zones and A/PTR records
  * <https://docs.ansible.com/ansible/latest/modules/win_dns_record_module.html>
  * <https://docs.ansible.com/ansible/latest/modules/win_command_module.html>

## Setup

* Run `install-deps.sh`
  * installs ansible + pywinrm module
* Ensure `vase.local` domain is created on DC
* Edit `inventory.ini` accordingly
* Run `DC-playbook.yml`
