#!/bin/bash

SRS_GIT=$HOME/git/srs.release
SRS_TAG=

# linux shell color support.
RED="\\033[31m"
GREEN="\\033[32m"
YELLOW="\\033[33m"
BLACK="\\033[0m"

function NICE() {
    echo -e "${GREEN}$@${BLACK}"
}

function TRACE() {
    echo -e "${BLACK}$@${BLACK}"
}

function WARN() {
    echo -e "${YELLOW}$@${BLACK}"
}

function ERROR() {
    echo -e "${RED}$@${BLACK}"
}

##################################################################################
##################################################################################
##################################################################################
if [[ -z $SRS_TAG ]]; then
  SRS_TAG=`(cd $SRS_GIT && git describe --tags --abbrev=0 2>/dev/null)`
  if [[ $? -ne 0 ]]; then
    echo "Invalid tag $SRS_TAG of $SRS_FILTER in $SRS_GIT"
    exit -1
  fi
fi

NICE "Build docker for $SRS_GIT, tag is $SRS_TAG"

OS=`python -mplatform 2>&1`
MACOS=NO && CENTOS=NO && UBUNTU=NO && CENTOS7=NO
echo $OS|grep -i "darwin" >/dev/null && MACOS=YES
echo $OS|grep -i "centos" >/dev/null && CENTOS=YES
echo $OS|grep -i "redhat" >/dev/null && CENTOS=YES
echo $OS|grep -i "ubuntu" >/dev/null && UBUNTU=YES
if [[ $CENTOS == YES ]]; then
    lsb_release -r|grep "7\." >/dev/null && CENTOS7=YES
fi
echo "OS is $OS(Darwin:$MACOS, CentOS:$CENTOS, Ubuntu:$UBUNTU) (CentOS7:$CENTOS7)"

# For gitee hub.
NICE "gitee hub release-v$SRS_TAG"

git commit -am "Release $SRS_TAG to docker hub"; git push
echo "Commit changes of tag $SRS_TAG for gitee"

git tag -d release-v$SRS_TAG 2>/dev/null
echo "Cleanup tag $SRS_TAG for gitee"

git tag release-v$SRS_TAG; git push -f gitee release-v$SRS_TAG
echo "Create new tag $SRS_TAG for gitee"
echo ""
