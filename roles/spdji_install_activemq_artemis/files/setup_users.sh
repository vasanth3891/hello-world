#!/bin/sh

#echo "${ARTEMIS_HOME} Setting up broker $(pwd) $(date)" > ${HOME}/zzz.txt
cd ${ARTEMIS_HOME}/../${BROKER_NAME}/bin
#echo "${ARTEMIS_HOME} Setting up broker $(pwd) $(date)" >> ${HOME}/zzz.txt

./artemis user add --user care_amquser --password care_amquser --role amq
./artemis user add --user ids_amquser --password ids_amquser --role amq
./artemis user add --user gdb_amquser --password gdb_amquser --role amq
./artemis user add --user spice_amquser --password spice_amquser --role amq
./artemis user add --user info_amquser --password info_amquser --role amq
./artemis user add --user ids_stg_amquser --password ids_stg_amquser --role amq
