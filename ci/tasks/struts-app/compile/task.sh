#!/bin/bash

mkdir -p build_artifacts
cd struts-examples
#mvn package -pl annotations -am
mvn package

if [ $? ]
then
  for i in `find . -name "*.war"|sort|grep -v test|grep -v mailreader`
  do
      cp $i ../build_artifacts/`dirname $i|cut -d'/' -f2`.war
  done
fi

TAR_FILE=struts-examples.tar.gz
tar -zcvf $TAR_FILE `find ../build_artifacts -name *.war` && mv $TAR_FILE ../build_artifacts/
