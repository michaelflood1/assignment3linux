sudo nano /etc/systemd/system/'file'.service
###unit file
[Unit]
Description=Uses webgen user to start a predefined script
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
User=webgen
Group=webgen
ExecStartPre=/bin/echo "Service about to start"
ExecStart=/path/to/your-script.sh
ExecStartPost=/bin/echo "Service has finished"

[Install]
WantedBy=multi-user.target


### timer file
[Unit]
Description=Persistent initiating of generate-index.service at 05:00 AM

[Timer]
OnCalendar=*-*-* 05:00:00
Persistent=true

[Install]
WantedBy=timers.target

#check syntax
sudo systemd-analyze verify /etc/systemd/system/generate-index.timer
sudo systemd-analyze verify /etc/systemd/system/generate-index.service

# check timers
sudo systemctl status my-service.timer

#check logs
sudo jounalctl -u file.service

#confirm file execution

bash script i.e every time the unit runs it echos executed into a file you made
or
sudo systemctl show -p ActiveState my-service.service
or
add this into your unit file
ExecStartPre=/bin/echo "Service about to start" >> /var/log/my-service.log
ExecStart=/path/to/your-script.sh
ExecStartPost=/bin/echo "Service has finished" >> /var/log/my-service.log
