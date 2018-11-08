#!/bin/bash
echo LOG FILE SAVED TO: $HOME/centrify-validate.out
echo "" >> touch $HOME/centrify-validate.out

touch $HOME/centrify-validate.out
echo `date`|  tee -a $HOME/centrify-validate.out
export DEFAULT_REALM=`cat /etc/krb5.conf | grep default_realm | cut -d"=" -f2`

echo $DEFAULT_REALM |  tee -a $HOME/centrify-validate.out

echo "Running adcheck tests - testing ADDC connectivity, operating system, network, and trust relationships for up to 5 domain controllers - tests should PASS" |  tee -a $HOME/centrify-validate.out
/usr/share/centrifydc/bin/adcheck  TSAD.UNX.SAS.COM  --bigdomain 5  --xdomain --performance -t ad -t  net -t  os |  tee -a $HOME/centrify-validate.out


echo "principals in systems host keytab file (aka /etc/krb5.keytab): "|  tee -a $HOME/centrify-validate.out

dzdo /usr/share/centrifydc/kerberos/bin/klist -kt /etc/krb5.keytab |  tee -a $HOME/centrify-validate.out



echo "Basic AD Info"|  tee -a $HOME/centrify-validate.out
adinfo |  tee -a $HOME/centrify-validate.out 
echo 
echo "Current Domain Controller: `adinfo --domain`"|  tee -a $HOME/centrify-validate.out 
echo 




echo "Current agent Mode (connected/offline):" `adinfo --mode` |  tee -a $HOME/centrify-validate.out
echo "Centrify Suite Version: " |  tee -a $HOME/centrify-validate.out

adinfo --suite-version |  tee -a $HOME/centrify-validate.out 

echo "Centrify Client Version:" |  tee -a $HOME/centrify-validate.out
adinfo --version|  tee -a $HOME/centrify-validate.out

 


 

echo "Active Directory connectivity for current domain:"  |  tee -a $HOME/centrify-validate.out
adinfo --test |  tee -a $HOME/centrify-validate.out

 
echo "Current joined Centrify zone:"  |  tee -a $HOME/centrify-validate.out
adinfo --zonedn|  tee -a $HOME/centrify-validate.out


echo "Server Join Name: "  |  tee -a $HOME/centrify-validate.out
adinfo --name|  tee -a $HOME/centrify-validate.out

echo "status of DNS cache + stats: "  |  tee -a $HOME/centrify-validate.out

adinfo --diag dns  |  tee -a $HOME/centrify-validate.out 


echo "Checking connectivity with an AD domain:"|  tee -a $HOME/centrify-validate.out
adinfo --test $DEFAULT_REALM |  tee -a $HOME/centrify-validate.out

 

echo "Checking network connectivity statistics: " |  tee -a $HOME/centrify-validate.out
adinfo --sysinfo neststate|  tee -a $HOME/centrify-validate.out 

echo AD Global Catalog:   |  tee -a $HOME/centrify-validate.out
 
adinfo --gc |  tee -a $HOME/centrify-validate.out

echo "AD domain/forest map: " |  tee -a $HOME/centrify-validate.out

adinfo --sysinfo domain|  tee -a $HOME/centrify-validate.out

 

echo "AD computer trust relationship status: " |  tee -a $HOME/centrify-validate.out
adinfo --sysinfo adagent|  tee -a $HOME/centrify-validate.out

 

echo testing user
echo  
read -p "Please enter an AD users shortname (next will prompt for pw):" ADUSER  
adinfo -A --user $ADUSER 



echo centrify.conf configuration file settings: |  tee -a $HOME/centrify-validate.out

adinfo --config |  tee -a $HOME/centrify-validate.out

 

echo Client in-memory configuration parameters: |  tee -a $HOME/centrify-validate.out

adinfo --sysinfo config |  tee -a $HOME/centrify-validate.out

 
echo "Checking /etc/nsswitch.conf for Centrify parameter in passwd, shadow and group settings: " |  tee -a $HOME/centrify-validate.out

cat /etc/nsswitch.conf | grep centrifydc|  tee -a $HOME/centrify-validate.out
 
echo 
echo "CHECKING KERBEROS CONFIGURATION Info" |  tee -a $HOME/centrify-validate.out
echo
echo

adinfo --computer|  tee -a $HOME/centrify-validate.out

echo "krb5.conf contents: " |  tee -a $HOME/centrify-validate.out
echo

cat /etc/krb5.conf |  tee -a $HOME/centrify-validate.out

 

echo "Encryption types of the systems cached ticket: " |  tee -a $HOME/centrify-validate.out

dzdo /usr/share/centrifydc/kerberos/bin/klist -fe /etc/krb5.ccache |  tee -a $HOME/centrify-validate.out

echo
read -p "Flush ad cache for `hostname` using adflush command? - you can run later by just running adflush command (Y/N)" YesNo
YN=`echo $YesNo | tr [:lower:] [:upper:]`

if [[ $YN = "Y" ]]
 then
    adflush  |  tee -a $HOME/centrify-validate.out 
else
  exit 0 
  echo ad cache not flushed|  tee -a $HOME/centrify-validate.out
fi

echo
echo "Checking GPO for Computer $HOSTNAME and $USER: "

adgpresult |  tee -a $HOME/centrify-validate.out


