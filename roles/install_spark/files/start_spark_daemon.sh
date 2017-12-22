SPARK_CONFIG_LOCATION=/local/apps/webutils/Spark/spark-daemon-process
if [[ ! -d ${SPARK_CONFIG_LOCATION}/logs ]] ; then
        mkdir ${SPARK_CONFIG_LOCATION}/logs
fi

if [[ ! -f ${SPARK_CONFIG_LOCATION}/logs/java_error_console.log ]] ; then
        echo "" > ${SPARK_CONFIG_LOCATION}/logs/java_error_console.log
fi
if [[ ! -f ${SPARK_CONFIG_LOCATION}/logs/java_console.log ]] ; then
        echo "" > ${SPARK_CONFIG_LOCATION}/logs/java_console.log
fi
if [[ ! -f ${SPARK_CONFIG_LOCATION}/logs/application.log ]] ; then
        echo "" > ${SPARK_CONFIG_LOCATION}/logs/application.log
fi

nohup java -server -Xmx2g -Xms1g -XX:PermSize=128M -XX:MaxPermSize=256m -XX:-UseSplitVerifier -Djava.awt.headless=true -jar ${SPARK_CONFIG_LOCATION}/advanced-analytics-utils-1.0-exe.jar 2>&1 >>/dev/null > ${SPARK_CONFIG_LOCATION}/logs/java_error_console.log > ${SPARK_CONFIG_LOCATION}/logs/java_console.log &
