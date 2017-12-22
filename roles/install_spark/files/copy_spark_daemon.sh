TAR_NAME="advanced-analytics-utils-1.0-SNAPSHOT.tar"

echo "copying advanced-analytics-utils-1.0-SNAPSHOT.tar"
cp ~/ids_build_area/indexcoreservices/spindices/advanced-analytics-utils/target/${TAR_NAME} .
rm -rf lib
tar -xvf ${TAR_NAME}
chmod a+rwx *spark_daemon.sh
echo "Tar extracted"
