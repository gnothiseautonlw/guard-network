# Guard-network
Guards netplan-defined network connections: It checks for internet connectivity and resets netplan if internet dropped. It stores a logfile in /var/log/guard-network.log

# Install
```
cd /opt
sudo git clone https://github.com/gnothiseautonlw/guard-network.git
sudo chmod 700 guard-network.sh
```

# Usage
Make a cronjob
```
sudo crontab -e
```
Add to the crontab file:
```
@reboot sleep 60 && /opt/guard-network/guard-network.sh
```
