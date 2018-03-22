#!/bin/bash


rm -rf ~/.aws
mkdir ~/.aws
chmod 700 ~/.aws

echo "[default]" > ~/.aws/credentials
echo "aws_access_key_id = ${AWS_ACCESS_KEY}" >> ~/.aws/credentials
echo "aws_secret_access_key = ${AWS_SECRET_KEY}" >> ~/.aws/credentials

echo "[default]" > ~/.aws/config
echo "region = ${AWS_REGION_NAME}" >> ~/.aws/config
echo "output = json" >> ~/.aws/config
echo "=================================================================="
env  | sort
echo "=================================================================="

cat ~/.aws/*

cd struts-examples
mvn package -pl annotations -am

if [ $? ]
then
  for i in `find . -name "*.war"|sort|grep -v test|grep -v mailreader`
  do
    echo aws s3 cp $i s3://${S3_BUCKET}/`dirname $i|cut -d'/' -f2`.war
    aws s3 cp $i s3://${S3_BUCKET}/`dirname $i|cut -d'/' -f2`.war
  done
fi