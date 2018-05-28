Raspberry Pi Zabbix
===================

Ansible role for installing Zabbix agent and configuring to monitor Raspberry Pi specific parameters. Role will install raspi-monitor.sh script that can monitor:

* board version
* board revision
* board serialnumber
* firmware version
* cpu voltage
* cpu clock
* cpu memmory
* cpu temperature
* gpu memmory


Role Variables
--------------

Script deployment path:
``rpi_monitor_script: /usr/local/sbin/raspi-monitor.sh``

The name of the service to be restarted:
``zabbix_agent_service: zabbix-agent``

Name of the Zabbix Agent package in repository:
``zabbix_agent_package: zabbix-agent``

Where is Zabbix Agent config is located at:
``zabbix_agent_config: /etc/zabbix/zabbix_agentd.conf``

Hostname of the server where Zabbix Agent is running (configured in Zabbix Server):
``zabbix_agent_hostname: "{{ inventory_hostname }}"``

Number of second Zabbix Agent should timeout Active checks scripts:
``zabbix_agent_timeout: 10``

UserParameters to be checked by Zabbix Agent:
``zabbix_agent_userparameters:
  - {name: "rpi.boardversion", command: "sudo {{ rpi_monitor_script }} boardversion"}
  - {name: "rpi.boardrevision", command: "sudo {{ rpi_monitor_script }} boardrevision"}
  - {name: "rpi.boardserialnumber", command: "sudo {{ rpi_monitor_script }} boardserialnumber"}
  - {name: "rpi.cpuvoltage", command: "sudo {{ rpi_monitor_script }} cpuvoltage"}
  - {name: "rpi.cpuclock", command: "sudo {{ rpi_monitor_script }} cpuclock"}
  - {name: "rpi.cpumem", command: "sudo {{ rpi_monitor_script }} cpumem"}
  - {name: "rpi.firmwareversion", command: "sudo {{ rpi_monitor_script }} firmwareversion"}
  - {name: "rpi.gpumem", command: "sudo {{ rpi_monitor_script }} gpumem"}
  - {name: "rpi.temperature", command: "sudo {{ rpi_monitor_script }} temperature"}``

IP address of the Zabbix Server:
``zabbix_server_ip: 127.0.0.1``

Scripts that will be zabbix user able to start without password as root:
``zabbix_user_sudoers_scripts: "{{ rpi_monitor_script }}"``


Dependencies
------------

None


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters):

.. code-block::

    - hosts: all 
      roles:
        - raspberry-pi-zabbix


Zabbix Template
---------------

Zabbix template ``raspberry-pi-zabbix_template.xml`` is stored in meta directory. You can import this template into your Zabbix in order to start monitoring your Raspberry Pi.

License
-------

MIT


Author Information
------------------

Created by Richard Kellner (`@RicCo386 <https://twitter.com/ricco386>`_).


Contributing
------------

Submit issues and pull requests on GitHub at `https://github.com/ricco386/raspberry-pi-zabbix`_.
