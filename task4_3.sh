#! /bin/bash
if ! [ -d /tmp/backups/ ]
 then
mkdir /tmp/backups/ ;
fi;
if ! [[ $# = 2 ]] 
 then
    echo 'bad number of arguments' >&2;
    exit 1;
fi;
param1="$1";
if   [ -d "${param1}" ]
then echo "${param1} is a directory and is Ok";
elif [ -f "${param1}" ]
then echo "${param1} is a file and is Ok";
else echo "${param1} is bad argument, an existing directory or file is needed" >&2;
     exit 1;
fi;
param2=$2;
re='^[0-9]+$'
if ! [[ $param2 =~ $re ]] 
then echo "${param2} is a bad argument" >&2;
exit 1;
else echo "${param2} is a number and is Ok";
fi;
fname=$(echo "${param1}"|sed -e 's/^.//'| sed 's/\//-/g');
#echo "${param1}";
tar czf "/tmp/backups/${fname}.tar.gz" "${param1}"; 
ls -l /tmp/backups | grep echo "${param1}" | wc -l;
