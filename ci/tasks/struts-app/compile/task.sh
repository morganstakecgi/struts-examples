#!/bin/bash

cd struts-examples
mvn package

if [ $? ]
then
  for i in `find . -name "*.war"|sort|grep -v test|grep -v mailreader`
  do

  done
fi