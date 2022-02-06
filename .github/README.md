# Ansible Playbooks
A collection of my playbooks as I learn Ansible within my virtual environment. This collection is not maintained for production use but is instead catered for my testing and learning/development.

## Goals
- [X] Create Operational Playbooks 👍
- [X] Implement Ansible-Vault for sensitive information 📋
- [X] Publish basic .zip or .tar file to bring a [collection of useful playbooks](https://github.com/NetworkNick-io/Operations/releases) into isolated environments 🛂
- [ ] Create "one-touch" deployment playbook for Cisco IOS XE and NXOS network devices 👨‍💻
- [ ] Simplify compliance and change-management with audit playbooks 🦺

## Playbooks

Playbook              | Features | Status 
| :-------------         | ------------- |--------|
| [backupConfigs.yml](https://github.com/NetworkNick-io/LearningAnsible/blob/main/playbooks/backupConfigs.yml)        | Create a log of all devices' running  configurations, software versions, interface statuses, etc.         | ✔️     |
| [changeEnable.yml](https://github.com/NetworkNick-io/LearningAnsible/blob/main/playbooks/changeEnable.yml)          | Change the enable password on all network devices                                                         | ✔️     |
| [setupAccessPorts.yml](https://github.com/NetworkNick-io/LearningAnsible/blob/main/playbooks/setupAccessPorts.yml)  | Configures generic functionality for a Layer2  access port                                                | ✔️     |
| [setupNTP.yml](https://github.com/NetworkNick-io/LearningAnsible/blob/main/playbooks/setupNTP.yml)                  | Configures any number of NTP servers with MD5  authentication                                             | ✔️     |
| [createFallbackAdmin.yml](https://github.com/NetworkNick-io/LearningAnsible/blob/main/playbooks/createAdmin.yml)    | Creates or changes the password for a local fallback administrative account and saves the configuration   | ✔️     |
| [removeLocalAccount.yml](https://github.com/NetworkNick-io/LearningAnsible/blob/main/playbooks/removeLocalAccount.yml)                                                                                              | Deletes a local account and saves the configuration                                                       | ✔️     |
| [controlFeatures.yml](https://github.com/NetworkNick-US/LearningAnsible/blob/main/playbooks/controlFeatures.yml) | Installs the appropriate features on Nexus switches. | ✔️     |
| [confibureBanner.yml](https://github.com/NetworkNick-US/LearningAnsible/blob/main/playbooks/setupBanner.yml) | Setup and configure a login banner on both NXOS and IOS/IOS XE Cisco devices for security and legal liability purposes. | ✔️     |
| [nxosFirstBoot.yml](https://github.com/NetworkNick-US/AnsiblePlaybooks/blob/main/playbooks/nxosFirstBoot.yml) | Hardening script for use on new devices | ✖️     |
| bouncePort.yml                                                                                                      | Shut/No Shut a port to resolve a port-security issue where automatic err-disable failsafes are not used   | ✖️     |
| nexusSetup.yml                                                                                                      | Configures required port-controls, security, logging, etc. functionality on a new device.                 | ✖️     |
| iosxeSetup.yml                                                                                                      | Configures required port-controls, security, logging, etc. functionality on a new device.                 | ✖️     |    

## Testbed
These playbooks were made for testing certain features or Ansible modules and aren't made for functional purposes.

Playbook              | Features | Useful
:-------------         | ------------- | -------------
[IOSfacts.yml](https://github.com/NetworkNick-io/LearningAnsible/blob/main/testbed/IOSfacts.yml) | Prints the output for several subsets of cisco.ios.ios_facts | 🚫

## Environment
![Lab Environment](https://i.imgur.com/sAibkpG.png)

## Follow Along

<details>
    <summary>Vault Information</summary>
    
  ```diff
  - All Vault Passwords: TestVault4321
  - Enable Password: BigLongPassword123!!
  - NTP Shared Key: TestKey123/TestKey1234s
  - AnsibleAdmin Account Password: MD5passwordtest!
  ```
</details>

<details>
    <summary>Caveats</summary>
    
  ```diff
  - This environment supports dropping authenticated users into enable mode by default. If your environment does not or cannot support this, you will have to append become: yes, become_method: enable, and become_password: enablePW, to your playbook, vault, or var files.
  + https://docs.ansible.com/ansible/latest/network/getting_started/network_differences.html#privilege-escalation)
  - Certain playbook features (namely connection:local) is not ideal for production use. Best-practices involve implementing connection: network_cli, but this is not supported in my virtual environment.
  ```
</details>

[Ansible Priveledge Escalation Documentation](https://docs.ansible.com/ansible/latest/network/getting_started/network_differences.html#privilege-escalation)
