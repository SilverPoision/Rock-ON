sudo apt-get update
sudo apt-get upgrade

sudo apt-get install -y git
sudo apt-get install rename
sudo apt-get install -y python3-pip
sudo apt-get install python-dnspython
apt install -y python-pip
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
git clone https://github.com/subfinder/subfinder.git
cd subfinder
go build
echo -e "\n\n\n\nSubfinder Done (Note:- Dont forget to comfigure the api key by \n ./subfinder --set-config VirustotalAPIKey=0x41414141 or \n see the full documentatio here https://github.com/subfinder/subfinder#post-installation-instructions"
echo "Subfinder Done"

##########################Censys##########################

echo "Installing Censys"
cd ..
git clone https://github.com/appsecco/bugcrowd-levelup-subdomain-enumeration.git
echo "Censys Done"

##########################Amass##########################

echo "Installing Amass"
go get -u github.com/OWASP/Amass/...
echo "Amass Done"


##########################Subrute##########################

echo "Installing Subrute"
git clone https://github.com/TheRook/subbrute.git
echo "Subrute Done"

##########################Fiercy##########################

echo "Installing Fiercy"
pip3 install fierce
echo "Fiercy Done"

##########################AltDNS##########################

echo "Installing AltDNS"
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

##########################Dirsearch##########################



echo "Installing Dirsearch"
git clone https://github.com/maurosoria/dirsearch.git
echo "Dirsearch Done"

##########################Dirsearch##########################

echo "Installing Censys"
git clone https://github.com/christophetd/censys-subdomain-finder.git
cd censys-subdomain-finder
pip install -r requirements.txt
echo "Be ready to insert the Censys API KEY and SECRET KEY"
echo "Enter Secret key"
read S_key
echo "Enter API key"
read API_key
export CENSYS_API_ID=$API_key
export CENSYS_API_SECRET=$S_key
echo "Censys Done"

##########################Linkfinder##########################

echo "Installing LinkFinder"
cd ..
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

##########################Vhost##########################

echo "Vhost"
git clone https://github.com/jobertabma/virtual-host-discovery.git
echo "Vhost Done"


#Cleaning Things
echo "Cleaning Your terminal"
rm -f amass_3.0.3_linux_amd64.zip subfinder_linux_amd64_0.2.zip README.md
echo "Once again don't forget to set the api keys for subfinder from here https://github.com/subfinder/subfinder#post-installation-instructions "




