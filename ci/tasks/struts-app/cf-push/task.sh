#!/bin/bash -e

cd build-artifacts
tar -zxvf *.tar.gz
cd ..

DEPLOY_FILE_NAMES=$(find build-artifacts -name "*.war")

cf login --skip-ssl-validation -o ${CF_ORG} -s ${CF_SPACE} -a $CF_API -u $CF_API_USER -p $CF_API_PASSWORD

echo "Deploying: " $DEPLOY_FILE_NAMES

for i in $DEPLOY_FILE_NAMES
do
  CMD="cf push -m750m `basename $i .war` -p $i"
  echo $CMD
  $CMD
done

