USER="$(whoami) "
export PID_TO_KILL=`ps -aef | grep -i advanced-analytics-utils-1.0-exe.jar | grep $USER| grep -v "grep -i"| awk '{print $2}'`
echo "Killing PID "$PID_TO_KILL
if [ "$PID_TO_KILL" != "" ]
then
       kill -9 $PID_TO_KILL 2>&1 1>> errorLog
else
        echo "Daemon process is already down."
fi
