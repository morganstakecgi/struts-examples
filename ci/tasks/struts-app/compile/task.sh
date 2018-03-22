#!/bin/bash

mkdir -p build_artifacts
cd struts-examples
mvn package -pl annotations -am

if [ $? ]
then
  for i in `find . -name "*.war"|sort|grep -v test|grep -v mailreader`
  do
      cp $i ../build_artifacts/`dirname $i|cut -d'/' -f2`.war
  done
fi