#!/bin/bash

RED='\033[0;31m'
orange='\033[93m'
green='\033[92m'
NC='\033[0m' # No Color

sudo chmod +x installer.sh
sudo chmod +x sub.sh
sudo chmod +x ASN.sh
sudo chmod +x recon.rb

echo -e ${orange}'
      (                          )      )  
      )\ )              )     ( /(   ( /(  
      (()/(           ( /(     )\())  )\()) 
       /(_)) (    (   )\())   ((_)\  ((_)\  
      (_))   )\   )\ ((_)\      ((_)  _((_) '${NC}
echo -e ${RED}'      | _ \ ((_) ((_)| |(_)    / _ \ | \| | 
      |   // _ \/ _| | / /    | (_) || .` |
      |_|_\\\___/\__| |_\_\_____\___/ |_|\_| 
                         |_____|            
'${NC}
echo -e "       ${orange}Made with${NC} ${RED}Love${NC} ${orange}by @Silverpoision${NC}"


echo -e "${RED}\n\nChoose which task you want to run:${NC}"
echo -e "${green}[1] Run Installer${NC}"
echo -e "${green}[2] Run Sub_Scraping${NC}"
echo -e "${green}[3] Run ASN_Enum${NC}"
echo -e "${green}[4] Run Resolver and other Attched Tools${NC}"


echo -e "\n\nEnter your selection!!"
read val
if [[ $val == "1" ]]; then
        ./installer.sh

elif [[ $val == "2" ]]; then
	    ./sub.sh

elif [[ $val == "3" ]]; then
	    ./ASN.sh

elif [[ $val == "4" ]]; then
	    ./recon.rb

else
        echo "Its not the correct option."
fi
