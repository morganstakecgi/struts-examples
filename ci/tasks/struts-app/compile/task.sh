#!/bin/bash

mkdir -p build_artifacts
cd struts-examples

if [[ -z ${STRUTS_PROJECTS} ]]
then
  mvn package
else
  for i in $STRUTS_PROJECTS
  do
    mvn package -pl "$i" -am;
  done
fi

if [ $? ]
then
  for i in `find . -name "*.war"|sort|grep -v test|grep -v mailreader`
  do
      cp $i ../build_artifacts/`dirname $i|cut -d'/' -f2`.war
  done
fi

TAR_FILE=struts-examples.tar.gz
tar -zcvf $TAR_FILE `find ../build_artifacts -name *.war` && mv $TAR_FILE ../build_artifacts/
