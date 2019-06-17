#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'
echo -e "${RED}Enter domain name${NC}"

#Storing the domain name to a variable
read domain
echo -e "Enter ${RED}IP${NC} address"
read ip
#Creating a directory with the entered domain name
mkdir $domain
#It requires API and SECRET key every time you use it.
echo "Be ready to insert the Censys API KEY and SECRET KEY"
echo -e "${RED}Enter API key${NC}"
read API_key
echo -e "${RED}Enter Secret key${NC}"
read S_key

#Running Sublister
echo "+--------------------------------Subdomains By Sublister-------------------------------------+"

python Tools/Sublist3r/sublist3r.py -d $domain -o $domain/sublister$domain.txt
echo -e \n\n "${RED}Sublister Ended..${NC}"

#Running Knock
echo "+--------------------------------Subdomains By Knock-------------------------------------+"

knockpy $domain -c
#Getting the latest file
myknock=$(echo $(ls -t |head -n1))
#Stripping out the domain coloum to the domain.txt
cut -d , -f 4 $myknock >> $domain/knockpy$domain.txt
rm -f $myknock
echo -e \n\n "${RED}Knock Ended..${NC}"

#Running Sublert
echo "+--------------------------------Subdomains By Sublert-------------------------------------+"
cd Tools/sublert
python sublert.py -u $domain
cd ..
cd ..
echo \n\n -e "${RED}Sublert Ended..${NC}"

#Running Censys 
echo "+--------------------------------Subdomains By Censys-------------------------------------+"
export CENSYS_API_ID=$API_key
export CENSYS_API_SECRET=$S_key
python Tools/censys-subdomain-finder/censys_subdomain_finder.py $domain -o $domain/censys$domain.txt
echo -e \n\n "${RED}Censys Ended..${NC}"

#Running Amass
echo "+--------------------------------Subdomains By Amass-------------------------------------+"
./Tools/amass enum -passive -d $domain -o $domain/amass$domain.txt
echo -e \n\n "${RED}Amass Ended..${NC}"

#Running SubFinder
echo "+--------------------------------Subdomains By SubFinder-------------------------------------+"
./Tools/subfinder/subfinder -d $domain -b -w Tools/my.txt -o $domain/subfinder$domain.txt
echo -e \n\n "${RED}Subfinder Ended..${NC}"

#Running CT
echo "+--------------------------------Subdomains By CT-------------------------------------+"
python Tools/bugcrowd-levelup-subdomain-enumeration/subdomain_enum_crtsh.py --domains $domain >> $domain/ct$domain.txt
echo -e \n\n "${RED}CT Ended..${RED}"

#Running CTFR
echo "+--------------------------------Subdomains By CTFR-------------------------------------+"
python3 Tools/ctfr/ctfr.py -d $domain -o $domain/ctfr$domain.txt
echo -e \n\n "${RED}CTFR Ended..${NC}"

#Running CTFR
echo "+--------------------------------Subdomains By Aquatone-------------------------------------+"
aquatone-discover --domain $domain
aquatone-takeover --domain $domain
echo -e "${RED}Aquatone Ended..${NC}"

#Running Wayback
echo "+--------------------------------Subdomains By Wayback-------------------------------------+"
curl -s "http://web.archive.org/cdx/search/cdx?url=*.$domain/*&output=text&fl=original&collapse=urlkey" |sort| sed -e 's_https*://__' -e "s/\/.*//" -e 's/:.*//' -e 's/^www\.//' | uniq >> $domain/wayback$domain.txt
echo -e \n\n "${RED}Wayback Ended..${NC}"

#Running San
echo "+--------------------------------Subdomains By San-------------------------------------+"
python Tools/San/san.py $domain >> $domain/san$domain.txt
echo -e \n\n "${RED}San Ended..${NC}"

#Running Vhost
echo "+--------------------------------Subdomains By VHost-------------------------------------+"
nmap --script http-vhosts -p 80,8080,443 $domain > $domain/vhost$domain.txt
echo -e \n\n "${RED}Vhost Ended..${NC}"

#Running FDNS
echo "+--------------------------------Subdomains By Rapid7 FDNS-------------------------------------+"
cat Tools/2019-05-31-1559261131-fdns_cname.json.gz | pigz -dc | grep -E "\.$domain" | jq .name | uniq > $domain/fdns$domain.txt
sed 's/\"//g' $domain/fdns$domain.txt > $domain/fdns_new$domain.txt
echo -e \n\n "${RED}Rapid7 FDSN Ended..${NC}"

#Running MassDNS
echo "+--------------------------------Subdomains By MassDNS-------------------------------------+"
python Tools/massdns/scripts/subbrute.py Tools/massdns/all.txt $domain | ./Tools/massdns/bin/massdns -r Tools/massdns/lists/resolvers.txt -t A -o S -w $domain/massdns$domain.txt
sed 's/A.*//' $domain/massdns$domain.txt | sed 's/CN.*//' | sed 's/\..$//' > $domain/massdns1$domain.txt 
echo -e \n\n "${RED}MassDNS Ended..${NC}"

echo "Combining all the Files"
cd $domain
cat sublister$domain.txt massdns1$domain.txt fdns_new$domain.txt knockpy$domain.txt censys$domain.txt amass$domain.txt subfinder$domain.txt ct$domain.txt ctfr$domain.txt wayback$domain.txt san$domain.txt > all.txt
sort all.txt | uniq > all2.txt
sed 's/*//g' all2.txt > all3.txt
sed 's/^.//' all3.txt > finalsub.txt
rm -f all.txt all2.txt all3.txt

curl -X POST -H 'Content-type: applicion/json' --data '{"text":"Your SubDomain Enumeration process for '$domain' has been completed"}' https://hooks.slack.com/services/TKHQXXXXX/BK6CGP62X/PtV7fggkgVpXX3xxxxxXXXXX

echo -e "${RED}Congractulations You have done all the tests ans the VHosts are secured in vhost.txt seperately${NC}"



