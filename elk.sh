wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add
echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list
sudo apt update && sudo apt install -y openjdk-8-jre-headless
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
sudo apt update && sudo apt install -y elasticsearch kibana
sudo sed -i 's/192.168.0.1/0.0.0.0/' /etc/elasticsearch/elasticsearch.yml
sudo sed -i 's/#network.host/network.host/' /etc/elasticsearch/elasticsearch.yml
sudo systemctl start elasticsearch.service
sudo sed -i 's/#server.host/server.host/' /etc/kibana/kibana.yml
sudo sed -i 's/localhost/0.0.0.0/' /etc/kibana/kibana.yml
sudo systemctl start kibana.service
