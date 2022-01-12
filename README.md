# LearningAnsible
A collection of my plays and playbooks as I learn Ansible within my virtual lab environment. This collection is not maintained for production use but is instead catered to testing and learning/devlopment.

## Goals
- [X] Create Operational Playbooks 👍
- [ ] Implement Ansible-Vault for sensitive information 📋
- [ ] Create "one-touch" deployment playbook for IOS XE and NXOS network devices 👨‍💻
- [ ] Publish basic .zip or .tar file to bring a collection of useful playbooks into isolated environments 🛂
- [ ] Simplify compliance and change-management with audit playbooks 🦺

## Playbooks

Playbook              | Features
-------------         | -------------
backupConfigs.yml     | Create a log of all devices' running configurations, software versions, interface statuses, etc.
changeEnable.yml      | Change the enable password on all network devices
setupAccessPorts.yml  | Configures generic functionality for a Layer2 access port
setupNTP.yml          | Configures any number of NTP servers with MD5 authentication

## Lab Environment
![Lab Environment](https://i.imgur.com/sAibkpG.png)
