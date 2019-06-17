#Enumerating Netblocks
echo "+--------------------------------IP's By ASN-------------------------------------+"
echo "Enter the ASN number:"

function asn_enum {
	read asn
	nmap --script targets-asn --script-args targets-asn.asn=$asn > netblocks$asn.txt
    sed '1,5d' netblocks$asn.txt > n1$asn.txt
    sed '$d' n1$asn.txt > n2$asn.txt
    sed 's/|//' n2$asn.txt > n3$asn.txt
    sed 's/_//' n3$asn.txt > n4$asn.txt
    sed "s/^[ \t]*//" n4$asn.txt > n5$asn.txt
    rm -f n1$asn.txt n2$asn.txt n3$asn.txt n4$asn.txt netblocks$asn.txt
    ./Tools/masscan/bin/masscan -p0-65535 -iL n5$asn.txt --rate 100000 -oG out$asn.txt
    curl -X POST -H 'Content-type: applicion/json' --data '{"text":"Your ASN Enumeration process for '$asn' has been completed"}' https://hooks.slack.com/services/TKHQXXXXX/BK6CGP62X/PtV7fggkgVpXX3xxxxxXXXXX

}


asn_enum
