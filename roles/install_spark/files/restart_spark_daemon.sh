SPARK_CONFIG_LOCATION=/local/apps/webutils/Spark/spark-daemon-process
FOOTER="\n\nThanks.\n\nThis is an automated message. Please do not reply to this message. Contact IDSSupport@spglobal.com for any queries."
USR_PROFILE=`whoami`
HOST_NAME=`hostname`
export FOOTER HOST_NAME USR_PROFILE
RESTART_INIT_BODY="Team, \nThis is for your information that the IDS Advanced Analytics utils application restart has been initiated on ${HOST_NAME}. The IDS Site may not reflect the real time index values for a while. You will be intimated once the daemon instances are back up. ${FOOTER}"
FROM_ADDRESS=IDSSupport@spglobal.com
RECEPIENTS="IDSDevelopmentTeam@spglobal.com"
SUBJECT="IDS Advanced Analytics utils application restart notification - ${HOST_NAME}"
SUBJECT_FAILURE="IDS Advanced Analytics utils application restart FAILURE notification - ${HOST_NAME}"
RESTART_CONF_BODY="Team, \nThis is for your information that the IDS Advanced Analytics utils application restart has been completed on ${HOST_NAME}. "
RESTART_FAIL_BODY="Team, \nThis is for your information that the restart script encountered some error while restarting and it needs your attention. Please check the logs for details. ${FOOTER}"

export RESTART_INIT_BODY FROM_ADDRESS RECEPIENTS SUBJECT RESTART_FAIL_BODY SUBJECT_FAILURE

echo -e "${RESTART_INIT_BODY}" | /bin/mail -s "${SUBJECT}" ${RECEPIENTS} -- -r ${FROM_ADDRESS}
echo "Notification email sent. Shutting down the daemon instance"
${SPARK_CONFIG_LOCATION}/stop_spark_daemon.sh

export PID_TO_KILL=`ps -aef | grep -i advanced-analytics-utils-1.0-exe.jar | grep $USER| grep -v "grep -i"| awk '{print $2}'`
if [ "$PID_TO_KILL" != "" ]
then
        echo "The process is still running. Some error occurred while invoking stop script"
        echo -e "${RESTART_FAIL_BODY}" | /bin/mail -s "${SUBJECT_FAILURE}" ${RECEPIENTS} -- -r ${FROM_ADDRESS}
else
        echo "Daemon instance stopped. Taking a power nap for about a minute..."
        sleep 60
        echo "Ahhh... just woke up and proceeding to next step.."
        echo "Starting the daemon instance.."
        cd ${SPARK_CONFIG_LOCATION}
		./start_spark_daemon.sh
        export PID_NEW_TO_KILL=`ps -aef | grep -i advanced-analytics-utils-1.0-exe.jar | grep $USER| grep -v "grep -i"| awk '{print $2}'`
        if [ "$PID_NEW_TO_KILL" == "" ]
        then
                echo "The process is not yet started. Some error occurred while invoking start script"
                echo -e "${RESTART_FAIL_BODY}" | /bin/mail -s "${SUBJECT_FAILURE}" ${RECEPIENTS} -- -r ${FROM_ADDRESS}
        else
                echo "Daemon started..."
                echo -e "${RESTART_CONF_BODY}" | /bin/mail -s "${SUBJECT}" ${RECEPIENTS} -- -r ${FROM_ADDRESS}
                echo "Notification email sent."
                echo "Restart process completed successfully "
        fi
fi
