This Repository contains a variety of Network Automation tools for Cisco devices.

The scripts are set to be executed on devices within the Cisco DevNet Sandbox currently. This can be changed in the code. 

TOOLS
<br>

--- get_status.py ---

Retrieves the status of each interface on a device using RESTCONF.
<br>

--- restconf.ps1 ---

Retrieves the running configuration of each interface on a device using RESTCONF.

The following url is documentation for IOS-XE RESTConf Yang Modules:
https://www.cisco.com/c/en/us/td/docs/ios-xml/ios/prog/configuration/167/b_167_programmability_cg/restconf_programmable_interface.html

<br>

--- Ansible IOS Backup ---

Ansible Playbook for backing up the running-configuration on Cisco devices.
The configs are copied to the local ansible server.
Tested on Ubuntu. Ansible must be installed as well as editing the host_vars file.

For getting started with Ansible Cisco modules:
https://developer.cisco.com/docs/ios-xe/#!ansible-quick-start-guide/documentation

https://docs.ansible.com/ansible/latest/collections/cisco/ios/ios_config_module.html

<br>
--- addDNA.py ---

Adds devices to Cisco DNA Center platform. DNA Center is a powerful Software Defined network management controller.
The IP Addresses and Credentials must be set. They are declared in the code at the beginning of the dna_add function.

<br>

More software to come...
