#!/bin/sh

# Get tor exit address
data=`curl -s https://check.torproject.org/exit-addresses`

if [ $? -ne 0 ]; then
   echo "Cannot get address."
   exit 1
fi
   echo "${data}" | grep "ExitAddress" | while read line
   do  ip=`echo "${line}" | sed -e "s/^ExitAddress \([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\).*/\1/g"`
   echo "${ip}"
done
