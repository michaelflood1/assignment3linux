sudo useradd -r -d /var/lib/webgen --group nginx --shell /usr/bin/nologin webgen
# creates system user with above directory and creates a group for it 

sudo chown -R webgen:webgen /var/lib/webgen
sudo chmod 700 /var/lib/webgen

gives ownership and whatnot