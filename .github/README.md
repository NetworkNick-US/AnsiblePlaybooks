# LearningAnsible
A collection of my playbooks as I learn Ansible within my virtual lab environment. This collection is not maintained for production use but is instead catered for my testing and learning/development.

## Goals
- [X] Create Operational Playbooks 👍
- [X] Implement Ansible-Vault for sensitive information 📋
- [ ] Publish basic .zip or .tar file to bring a collection of useful playbooks into isolated environments 🛂
- [ ] Create "one-touch" deployment playbook for Cisco IOS XE and NXOS network devices 👨‍💻
- [ ] Simplify compliance and change-management with audit playbooks 🦺

## Playbooks

Playbook              | Features | Status
:-------------         | ------------- | -------------
[backupConfigs.yml](https://github.com/NetworkNick-io/LearningAnsible/blob/main/playbooks/backupConfigs.yml)        | Create a log of all devices' running  configurations, software versions, interface statuses, etc.         | ✔️
[changeEnable.yml](https://github.com/NetworkNick-io/LearningAnsible/blob/main/playbooks/changeEnable.yml)          | Change the enable password on all network devices                                                         | ✔️
[setupAccessPorts.yml](https://github.com/NetworkNick-io/LearningAnsible/blob/main/playbooks/setupAccessPorts.yml)  | Configures generic functionality for a Layer2  access port                                                | ✔️
[setupNTP.yml](https://github.com/NetworkNick-io/LearningAnsible/blob/main/playbooks/setupNTP.yml)                  | Configures any number of NTP servers with MD5  authentication                                             | ✔️
[createFallbackAdmin.yml](https://github.com/NetworkNick-io/LearningAnsible/blob/main/playbooks/createAdmin.yml)    | Creates or changes the password for a local fallback administrative account and saves the configuration   | ✖️
removeLocalAccount.yml                                                                                              | Deletes a local account and saves the configuration                                                       | ✖️
bouncePort.yml                                                                                                      | Shut/No Shut a port to resolve a port-security issue where automatic err-disable failsafes are not used   | ✖️
nexusSetup.yml                                                                                                      | Configures required port-controls, security, logging, etc. functionality on a new device.                 | ✖️
iosxeSetup.yml                                                                                                      | Configures required port-controls, security, logging, etc. functionality on a new device.                 | ✖️      

## Environment
![Lab Environment](https://i.imgur.com/sAibkpG.png)

## Follow Along

<details>
    <summary>Vault Information</summary>
    
  ```diff
  - All Vault Passwords: TestVault4321
  - Enable Password: BigLongPassword123!!
  - NTP Shared Key: TestKey123/TestKey1234
  ```
</details>

<details>
    <summary>Caveats</summary>
    
  ```diff
  - This environment supports dropping authenticated users into enable mode by default. If your environment does not or cannot support this, you will have to append become: yes, become_method: enable, and become_password: enablePW, to your playbook, vault, or var files. [Ansible Documentation](https://docs.ansible.com/ansible/latest/network/getting_started/network_differences.html#privilege-escalation)
  ```
</details>
