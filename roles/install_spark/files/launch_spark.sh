#!/bin/sh
###### SAMPLE PORTS 2181,2888,7001,3888 #################

        echo "#### Launching SPARK #####"

        SPARK_HOME=/local/apps/webutils/Spark/spark-2.1.1-bin-hadoop2.7

        echo "#Going to Spark home directory#"
        cd $SPARK_HOME/sbin

        echo "#Starting Spark Master on port 7077"
        #./start-master.sh -i {{ host }} -p 39000 --webui-port 39100
        ./start-master.sh -i localhost -p 2181 --webui-port 2888

        echo "#starting Spark Slave on port 7077#"

        #./start-slave.sh -i {{ host }} -p 39001 --webui-port 39101 spark://{{ host }}:39000
        ./start-slave.sh -i localhost -p 7001 --webui-port 3888 spark://localhost:2181

        echo "Spark master and slave web UI ports 8080 and 8081 "
        
        echo "SPARK MASTER WEB UI: http://localhost:2888"
        echo "SPARK SLAVE WEB UI : http://localhost:3888"

