#!/bin/bash

WORK_DIR=struts-app-cast-artifacts
TAR_FILE=$WORK_DIR/struts-examples-cast-analysis.tar.gz

mkdir -p $WORK_DIR
cd struts-examples
java -jar ${CAST_AGENT_JAR} --analyzerDir  ${CAST_AGENT_PERL} --workingDir ${WORK_DIR} --sourceDir . --skipUpload
tar -zcvf $TAR_FILE `find ${WORK_DIR}`


#java -jar /Users/morgan.stake/highlight/Highlight-Automation-Command/HighlightAutomation.jar --analyzerDir  “<path to the untarred file>/perl” --workingDir "/Users/morgan.stake/highlight.work" --sourceDir /Users/morgan.stake/git/spring-music  --login "morgan.stake@cgi.com --password "***********" --applicationId 1234 --companyId 1234 --serverUrl "https://rpa.casthighlight.com"
# --ignoreDirectories "test,jquery" --skipUpload




