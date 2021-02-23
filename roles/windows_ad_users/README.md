# windows_ad_users

## Tasks

* main
* admin
  * create admin users and assign to admin groups
* cdt
  * create CDT users + TA
* pentest
  * creat pentest users + TA

## Users

Defined as `<user> - <groups>`

* Admin
  * egallis - Domain Admin, vCenter Admins, Domain User (testing for deploy)
* CDT
  * TeamA - Domain User, CDT
  * TA_CDT - Domain User, CDT, CDT TA
* Pentest
  * PentestA - Domain User, Pentest
  * TA_CDT - Domain User, Pentest, Pentest TA
  