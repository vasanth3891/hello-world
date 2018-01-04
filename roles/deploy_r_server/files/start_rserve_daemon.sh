#!/bin/sh
            echo "$(date)"
          # HOME="{{ user_home_directory }}"
            R_HOME=$HOME/RServer/R-3.3.3_build/lib64/R
            R_PROCESS_COUNT=$(pgrep Rserve | wc -l)
            if [ "$R_PROCESS_COUNT" -ge "1" ]
            then
                echo "Rserve Daemon is already running"
                ps ax | grep Rserve
                exit;
            else
                cd ${R_HOME}/bin
                echo "Starting Rserve daemon process"
                ./R -e 'library(Rserve)' -e 'Rserve(args=" --no-save --RS-conf ${R_HOME}/etc/Rserv.conf")'
                echo "R server started on PORT 6311"
                ps ax | grep Rserve
            fi