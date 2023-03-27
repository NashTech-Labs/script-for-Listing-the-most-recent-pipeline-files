#!/bin/bash

if (( $# == 1 ))
then
   param_fr_wm=$1
else
   param_fr_wm=10
fi

# Variables section
temporaray_file=/tmp/wm_listdirtmp.txt
logfile=/tmp/wm_listdir.txt
((param_fr_wm = $param_fr_wm * 2))

integer plfiles=0

#Determines the directory for the Integration Server by checking if specific directories exist.

if [[ -d /wm_1011 ]]
then
   IS_Directory=/wm_1011/IntegrationServer
elif [[ -d /wm_is/v61 ]]
then
   IS_Directory=/wm_is/v61/IntegrationServer
else
   IS_Directory=/wm_is/IntegrationServer
fi
#Creates a temporary file to store the list of pipeline files.
echo > ${temporaray_file}

#Lists the most recent pipeline files in the specified directory and writes them to the temporary file.

ls -rt ${IS_Directory}/pipeline|grep -v pipelinebak > ${temporaray_file}

#Writes the last 30 files from the temporary file to a log file, with a separator "#@" between each file name.
for filename in `tail -n 30 ${temporaray_file}`
do
  echo $filename >> ${logfile}
  echo "#@" >> ${logfile}
done
tail -n $param_fr_wm ${logfile}

#Removes the temporary and log files.

rm -f ${logfile}
rm -f ${temporaray_file}

