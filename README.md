# Guard-network
Guards netplan-defined network connections: It checks for internet connectivity and resets netplan if internet dropped. It stores a logfile in /var/log/guard-network.log

# Install
```
mkdir /opt/guard-network
cd /opt/guard-network
sudo git clone 
chmod 700 guard-network.sh
```

# Usage
```
sudo crontab -e #Make a cronjob
```
Add to the crontab file:
```
@reboot sleep 60 && /opt/guard-network/guard-network.sh
```
