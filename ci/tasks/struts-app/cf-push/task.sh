#!/bin/bash -e

cd struts-app-build-artifacts
tar -zxvf *.tar.gz
cd ..

DEPLOY_FILE_NAMES=$(find struts-app-build-artifacts -name "*.war" | sort )

echo "==========================================="
echo "Deploying: "
echo "==========================================="
for i in $DEPLOY_FILE_NAMES
do
  printf "|\t App: %-25s \t|  using %-60s \n" `basename $i .war` $i
done
echo "==========================================="

cf login --skip-ssl-validation -o ${CF_ORG} -s ${CF_SPACE} -a $CF_API -u $CF_API_USER -p $CF_API_PASSWORD
for i in $DEPLOY_FILE_NAMES
do
  CMD="cf push -m750m `basename $i .war` -p $i"
  echo $CMD
  $CMD
done

