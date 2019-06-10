#!/bin/bash

echo "Enter domain name"

#Storing the domain name to the var
read domain
#Creating a directory with the entered domain name
mkdir $domain

#Running Sublister
echo "+--------------------------------Subdomains By Sublister-------------------------------------+"

python Tools/Sublist3r/sublist3r.py -d $domain -o $domain/$domain.txt
echo "\nSublister Ended.."

#Running Knock
echo "+--------------------------------Subdomains By Knock-------------------------------------+"

knockpy $domain -c
#Getting the latest file
myknock=$(echo $(ls -t |head -n1))
#Stripping out the domain coloum to the domain.txt
cut -d , -f 4 $myknock >> $domain/$domain.txt
echo "\nKnock Ended.."

#Running Censys 
echo "+--------------------------------Subdomains By Censys-------------------------------------+"
python Tools/censys-subdomain-finder/censys_subdomain_finder.py $domain -o $domain/$domain.txt
echo "\nCensys Ended.."

#Running Amass
echo "+--------------------------------Subdomains By Censys-------------------------------------+"
