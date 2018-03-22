#!/bin/bash -e

DEPLOY_FILE_NAME=$(readlink -f build-artifacts/*.war)

cf login --skip-ssl-validation -o ${CF_ORG} -s ${CF_SPACE} -a $CF_API -u $CF_API_USER -p $CF_API_PASSWORD

echo "Deploying: " $DEPLOY_FILE_NAME

for i in $DEPLOY_FILE_NAME
do
  CMD="cf push -m750m `basename $i .war` -p $i"
  echo $CMD
  $CMD
done

