# Rock-ON (A One-Shoot Killer)
![Rock-ON Logo](logo1.jpg)

Rock-On is a all in one recon tool that will help your Recon process give a boost. It is mainley aimed to automate the whole process of recon and save the time that is being wasted in doing this all stuffs manually.

# Recommendation

Machine Configuration - Debian- 9.4, 4 GB RAM on DigitalOcean and its will be good to run this tool on a new and fresh VPS.

# Tools Added

1. Sublist3r 
1. Knock 
1. Subfinder 
1. Censys 
1. Amass 
1. CT Logs 
1. CTFR 
1. Wayback 
1. San Domains 
1. AltDns 
1. More to be added...


# Requirements

Go-Languange

Install by Following methods:
```
wget https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.12.5.linux-amd64.tar.gz
nano ~/.profile
```
Add this lines
``` 
export PATH=$PATH:/usr/local/go/bin
export GOROOT=/usr/local/go
```

# Installation

Note: For a new Fresh VPS run this commands first:
```
sudo apt-get upgrade
sudo apt-get update
sudo apt-get install git
```

```
chmod +x rockon.sh
./rockon.sh
```

# Usage

```
./rockon.sh
```
Enter your choice and then the required Information.

# Give Rock-On some Love

If this tool was useful to you during your recon stages - I would love to know. Any suggestions or ideas for this tool are appreciated - Just DM me on [Facebook](https://www.facebook.com/silverpoision) or [Twitter](https://twitter.com/SilverPoision)
