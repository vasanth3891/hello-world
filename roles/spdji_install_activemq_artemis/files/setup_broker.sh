#!/bin/sh

#echo "${ARTEMIS_HOME} Setting up broker $(pwd)" > ${HOME}/zzz.txt

cd ${BROKER_HOME}

#java -version > ${HOME}/zzz.txt

${ARTEMIS_HOME}/bin/artemis create --clustered --replicated --user amquser --password amquser --role amq --host ${MY_HOST} --cluster-user amqcuser --cluster-password amqcuser --require-login --default-port ${BROKER_PORT} --name ${BROKER_NAME} ${BROKER_MASTER_SLAVE_MARK} ${BROKER_NAME}
