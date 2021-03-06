#!/bin/bash
    echo "Transparent Huge Page Status: "
    cat /sys/kernel/mm/transparent_hugepage/enabled  
    cat /sys/kernel/mm/transparent_hugepage/defrag
    if test -f /sys/kernel/mm/transparent_hugepage/enabled
        then 
            echo never > /sys/kernel/mm/transparent_hugepage/enabled 
            echo "echo never > /sys/kernel/mm/transparent_hugepage/enabled" >> /etc/rc.local
    fi
    if test -f /sys/kernel/mm/transparent_hugepage/defrag
        then 
            echo never > /sys/kernel/mm/transparent_hugepage/defrag
            echo "echo never > /sys/kernel/mm/transparent_hugepage/defrag" >> /etc/rc.local
    fi
    if test -f /sys/kernel/mm/redhat_transparent_hugepage/enabled
        then 
            echo never > /sys/kernel/mm/redhat_transparent_hugepage/enabled 
            echo "echo never > /sys/kernel/mm/redhat_transparent_hugepage/enabled" >> /etc/rc.local
    fi
    if test -f /sys/kernel/mm/redhat_transparent_hugepage/defrag
        then 
            echo never > /sys/kernel/mm/redhat_transparent_hugepage/defrag 
            echo "echo never > /sys/kernel/mm/redhat_transparent_hugepage/defrag" >> /etc/rc.local
    fi
    echo "new status of THP"
        cat /sys/kernel/mm/transparent_hugepage/enabled
        cat /sys/kernel/mm/transparent_hugepage/defrag
    echo "checking /etc/rc.local"
        cat /etc/rc.local | grep -v "#"
