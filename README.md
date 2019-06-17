# Rock-ON (A One-Shoot Killer)
![Rock-ON Logo](Images/logo1.jpg)

Rock-On is a all in one recon tool that will help your Recon process give a boost. It is mainley aimed to automate the whole process of recon and save the time that is being wasted in doing all this stuffs manually. A thorough blog will be up in sometime. Stay tuned for the Stable version with a UI.

# Recommendation

Machine Configuration - Debian- 9.4, 4 GB RAM on DigitalOcean and its will be good to run this tool on a new and fresh VPS.

### For Censys: 
Set the API and SECRET KEY in the sub.sh unless you want to set it again and again. 

For removing:
```
1. Delete the lines 13-18
2. Then set you API and SECRET KEY on line 47 & 48 like this: export CENSYS_API_ID=your_key_here
```

### For getting notification on Slack: 
Change the webhook address to your one in sub.sh and ASN.sh to get notification while you do your other work.

For changing:
```
Replace the Webhook address at line 113 in sub.sh and 15 in ASN.sh
```

# Tools Added
Thanks to all the aurthors who have written these scripts and making a huge contribution to the great community. A big shout-out for @ehsahil for his blog on recon that helped me a lot while making this tool and taking examples for the repository.

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
1. NMAP
1. Masscan
1. MassDNS
1. Sublert
1. Aquatone
1. Vhost
1. Rapid7 FDNS DB
1. AWS-CLI
1. Dirsearch

1. More to be added...


# Requirements

### Go-Languange

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

### Note: For a new Fresh VPS run this commands first:
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

# Screenshot
![Rock-ON SC](Images/Screenshot%202019-06-17%20at%2012.33.34%20PM.png)
![Rock-ON SC](Images/Screenshot%202019-06-17%20at%2012.44.42%20PM.png)

# Give Rock-On some Love

If this tool was useful to you during your recon stages - I would love to know. Any suggestions or ideas for this tool are appreciated - Just DM me on [Facebook](https://www.facebook.com/silverpoision) or [Twitter](https://twitter.com/SilverPoision)
