#!/bin/sh
           echo "$(date)"
           USER="$(whoami)"
         # HOME="{{ user_home_directory }}"
           R_HOME=$HOME/RServer/R-3.3.3_build/lib64/R
           R_PROCESS_COUNT=$(pgrep Rserve | wc -l)
       # PID_TO_KILL=$(ps -aef | grep -i Rserve | grep $USER|  grep -v "grep -i"| awk '{print $2}')
     PID_TO_KILL=$(pgrep -f Rserve)
    echo "Rserve process count $R_PROCESS_COUNT"
           if [ "$R_PROCESS_COUNT" -ge "1" ]
           then
               echo "Rserve Daemon is being stopped"
               echo "no further connections from clients possible"
               echo "Killing PID "$PID_TO_KILL
               kill -9 $PID_TO_KILL
           else
            echo "There is no Rserve Daemon process to be stopped"
          fi