#!/bin/bash

DEPLOY_FILE_NAME=$(readlink -f build-artifacts/$STRUTS_APP_NAME*.war)

cf login -a $CF_API -u $CF_API_USER -p $CF_API_PASSWORD
cf push $STRUTS_APP_NAME -p $DEPLOY_FILE_NAME -i $UI_APP_INSTANCE_COUNT -d $APPS_DOMAIN_NAME --no-start

array=(${UI_APP_SERVICES//,/ })
for i in "${!array[@]}"
do
    echo "Binding ${array[i]} service to app $STRUTS_APP_NAME"
    cf bs $STRUTS_APP_NAME ${array[i]}
done

cf set-env $STRUTS_APP_NAME STRUTS_APP_NAME $STRUTS_APP_NAME
cf start $STRUTS_APP_NAME