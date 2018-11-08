#!/bin/bash
#Script to install various repositories
#Source of REPO URLS; https://tecadmin.net/top-5-yum-repositories-for-centos-rhel-systems/

#TO BE ADDED: SAS Internal Repos!

while true
tput clear
        do
            tput rev
            echo "REPO Installer M A I N - M E N U"
            tput sgr0
            echo "Select Repository to Install for $PRETTY_NAME:"
            echo ""
            echo -e "\t1. " EPEL for CentOS/RHEL 7
            echo -e "\t2. " EPEL for CentOs/RHEL 6
            echo -e "\t3. " RPM Fusion for CentOS/RHEL 7
            echo -e "\t4. " RPM Fusion for CentOS/RHEL 6
            echo -e "\t5. " REMI for CentOS/RHEL 7
            echo -e "\t6. " REMI for CentOS/RHEL 6
            echo -e "\t7. " Cloudera Hadoop CDH Latest by Cloudera - Latest Repo
             echo -e "\t8. "Hortonworks Hadoop Ambari Repo latest - RHEL/Centos 7
           echo -e "\t9. " TO BE ADDED - SAS Repos # https://saszone.unx.sas.com:8443/display/TUM/Internal+SAS+RHEL+DVD+Repo%27s
            echo -e "\0. Quit"

read ANS

tput clear

case $ANS in 
    1)
    echo "EPEL for CentOS/RHEL 7"
             ### For CentOS/RHEL 7 ###
    sudo yum install -y epel-release
    ;;

    2)
    echo "EPEL for CentOS/RHEL 6"
        ### For CentOS/RHEL 6 ###
    sudo yum install -y epel-release
        
    Continue
    ;;
    
    3)
    echo "RPM Fusion for CentOS/RHEL 7"
  ### For CentOS/RHEL 7 ###
    sudo yum localinstall -y --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm 
    sudo yum localinstall -y --nogpgcheck https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-7.noarch.rpm
    ;;

    4) 
 echo "RPM Fusion for CentOS/RHEL 6"

sudo yum localinstall -y --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-6.noarch.rpm
sudo yum localinstall -y --nogpgcheck https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-6.noarch.rpm
    ;;

    5) 
echo "REMI for CentOS/RHEL 7"
### For CentOS/RHEL 7 ###
sudo yum localinstall -y --nogpgcheck http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
### Fedora 27/26/25/24 ###
    ;;

    6)
        echo "REMI for CentOS/RHEL 6"
        ### For CentOS/RHEL 6 ###
        sudo yum localinstall -y --nogpgcheck http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
    ;;
    7) #https://www.cloudera.com/documentation/enterprise/latest/topics/cdh_ig_cdh5_install.html#topic_4_4_1__p_32
        echo "Cloudera Hadoop CDH Latest by Cloudera - Latest Repo"
        export NIXVER=`uname -a | awk '{print $3}' | cut -d"." -f1`
        echo $NIXVER

        if [[ $NIXVER = 3 ]]
            then
                echo "RHEL/CentOs Linux 7 Distro Found"
                echo "installating latest CDH Repository for: " $NIXVER
                read "Press Enter when ready"
                wget -O  /etc/yum.repos.d/cloudera-manager.repo   https://archive.cloudera.com/cdh5/redhat/7/x86_64/cdh/cloudera-cdh5.repo
                 sleep 3
                if [[ -f  /etc/yum.repos.d/cloudera-manager.repo ]]; 
                    then echo Cloudera Manager Repo File Exists /etc/yum.repos.d/cloudera-manager.repo
                         echo "System Current date:"
                        date | awk '{print $1" " $2" "$3 " " $x}' | cut -d" " -f1,2,3,8 | cut -d":" -f1,2
                        echo "date of repo creation/modification:"
                        ls -la /etc/yum.repos.d/cloudera-manager.repo | cut -d " " -f6-
                        #ls -la /etc/yum.repos.d/cloudera-manager.repo | cut -d " " -f6- | awk '{print $1 " " $2 " " $3}'
                    else 
                        echo Repo File Not Found at /etc/yum.repos.d/cloudera-manager.repo
                        ls -la /etc/yum.repos.d/
                fi



	    elif [ $NIXVER = 2 ]
    	    then 
                echo "RHEL/CentOs Linux 6 Distro Found with Kernel: "
            
                read "Press Enter when ready"
        	wget -O  /etc/yum.repos.d/cloudera-manager.repo https://archive.cloudera.com/cdh5/redhat/6/x86_64/cdh/cloudera-cdh5.repo
            sleep 3



        else
            echo "Niether Linux 6 nor 7  found - aborting"
        fi
        echo "Cloudera Hadoop CDH Latest by Cloudera - Latest Repo - DONE"
        echo "Updating Repolist + Cleaning Repos"
        yum clean all
        yum repolist
        read "Press any button to return to main menu..."


    ;;
    8) 
        echo "Hortonworks Hadoop Ambari Repo latest - RHEL/Centos 7"
        wget -nv http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.6.1.3/ambari.repo -O /etc/yum.repos.d/ambari.repo
        yum install -y mysql-connector-java
        ls /usr/share/java/mysql-connector-java.jar
        #chmod 644 /usr/share/java/mysql-connector-java.jar
  #  https://docs.hortonworks.com/HDPDocuments/Ambari-2.6.1.0/bk_ambari-installation/content/ambari_repositories.html
;;

    0)
        echo -e "	"
	    echo -e "	"
	    echo "Exiting"
		break
	esac #From Iteration 1

done # End MENU while loop (iteration 1)
    

    #elif [ -f "/etc/os-release" ]
     #then#
#
 #   else
#	distroname="$(uname -s) $(uname -r)"
#fi


### For CentOS/RHEL 6 ###

  

