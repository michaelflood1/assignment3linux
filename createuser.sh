sudo groupadd nginx

sudo useradd -r -d /var/lib/webgen --group nginx --shell /usr/bin/nologin webgen
# creates system user with above directory and add into group for it 

sudo mkdir -p /var/lib/webgen/bin
sudo mkdir -p /var/lib/webgen/HTML

sudo chown -R webgen:webgen /var/lib/webgen
sudo chmod 700 /var/lib/webgen

gives ownership and whatnot
