sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y git
sudo apt-get install rename
sudo apt-get install -y python3-pip
sudo apt-get install python-dnspython
apt install -y python-pip
sudo pip install -U requests
gem install colorize
sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
apt install python-pip
apt install python3-pip
apt install curl
sudo apt-get install git gcc make libpcap-dev
apt-get install ruby-full
pip install feedparser
pip install awscli
pip3 install fierce
pip install pyopenssl
sudo apt-get install pigz

RED='\033[0;31m'
NC='\033[0m' # No Color

mkdir Tools
cd Tools

##########################Sublister##########################

echo "Installing Sublister"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
sudo pip install -r requirements.txt
echo "Sublist3r Done."

##########################Knock##########################

echo "Installing Knock"
cd ..
git clone https://github.com/guelfoweb/knock.git
cd knock/knockpy
echo "Enter Your Virustotal API_key"
read knockVTapi
echo '{
        "virustotal": "'$knockVTapi'"
}' > config.json

cd ..
sudo python setup.py install
echo "Done setting UP the Knock"

##########################Subfinder##########################

echo "Installing Subfinder"
cd ..
go get github.com/subfinder/subfinder
wget "https://github.com/assetnote/commonspeak2-wordlists/raw/master/subdomains/subdomains.txt"
mv subdomains.txt my.txt
git clone https://github.com/subfinder/subfinder.git
cd subfinder
go build
echo -e \n\n "${RED}Subfinder Done (Note:- Dont forget to comfigure the api key by \n ./subfinder --set-config VirustotalAPIKey=0x41414141 or \n see the full documentatio here https://github.com/subfinder/subfinder#post-installation-instructions${NC}"
echo "Subfinder Done"

##########################Censys##########################

echo "Installing Censys"
cd ..
git clone https://github.com/appsecco/bugcrowd-levelup-subdomain-enumeration.git
echo "Censys Done"

##########################Amass##########################

echo "Installing Amass"
go get -u github.com/OWASP/Amass/...
echo "Enter the Directory where go/bin/ is installed"
echo "For Example root/go/bin/amass"
cd ..
read dir
mv $dir Tools/
echo "Amass Done"

##########################AltDNS##########################

echo "Installing AltDNS"
cd Tools/
git clone https://github.com/infosec-au/altdns.git
cd altdns
pip install -r requirements.txt
echo "AltDNS Done"

##########################NMAP##########################

echo "Installing NMAP"
cd ..
sudo apt-get install nmap
echo "NMAP Done"

##########################MassDNS##########################

echo "Installing MassDNS"
git clone https://github.com/blechschmidt/massdns.git
cd massdns
wget https://gist.githubusercontent.com/jhaddix/86a06c5dc309d08580a018c66354a056/raw/f58e82c9abfa46a932eb92edbe6b18214141439b/all.txt
make
echo "MassDNS Done"

##########################EyeWitness##########################

echo "Installing EyeWitness"
cd ..
git clone https://github.com/FortyNorthSecurity/EyeWitness.git
echo "EyeWitness Done"

##########################MassScan##########################

echo "Installing MassScan"
git clone https://github.com/robertdavidgraham/masscan
cd masscan
make
echo "MassScan Done"

##########################CTFR##########################

echo "Installing CTFR"
cd ..
git clone https://github.com/UnaPibaGeek/ctfr.git
cd ctfr
pip3 install -r requirements.txt
echo "CTFR Done"

##########################Aquatone##########################

echo "Installing Aquatone"
cd ..
gem install aquatone
echo "Aquatone Done"

##########################SUBlert##########################

echo "Installing SUblert"
git clone https://github.com/yassineaboukir/sublert.git && cd sublert
sudo pip install -r requirements.txt
cd ..

##########################Dirsearch##########################

echo "Installing Dirsearch"
git clone https://github.com/maurosoria/dirsearch.git
echo "Dirsearch Done"

##########################Censys##########################

echo "Installing Censys"
git clone https://github.com/christophetd/censys-subdomain-finder.git
cd censys-subdomain-finder
pip install -r requirements.txt
echo "Censys Done"

##########################Knock##########################

echo "Downloading FDNS dataset"
cd ..
wget https://opendata.rapid7.com/sonar.fdns_v2/2019-05-31-1559261131-fdns_cname.json.gz

##########################Linkfinder##########################

echo "Installing LinkFinder"
git clone https://github.com/GerbenJavado/LinkFinder.git
cd LinkFinder
python setup.py install
echo "Linkfinder Done"

##########################Jsparser##########################

echo "Installing Jsparser"
cd ..
git clone https://github.com/nahamsec/JSParser.git
python setup.py install
echo "JSParser Done"

##########################SAN##########################

echo "Installing San"
git clone https://github.com/SilverPoision/San.git
echo "San Done"

##########################Vhost##########################

echo "Vhost"
git clone https://github.com/jobertabma/virtual-host-discovery.git
cd virtual-host-discovery
wget https://github.com/SilverPoision/San/blob/master/word.txt
cd ..
echo "Vhost Done"
echo -e \n\n "${RED}Once again don't forget to set the api keys for subfinder from here https://github.com/subfinder/subfinder#post-installation-instructions and also setting the AWS CLI creds. ${NC}"
