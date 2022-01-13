#!/bin/bash

echo "Enter the data key to be retrieved:"  
read data_key
if [ -z "$data_key" ]
 then
        json_meta_data=`curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | python -c "import json,sys; print json.loads(sys.stdin.read())"`
else
        json_meta_data=`curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | python -c "import json,sys; print json.loads(sys.stdin.read())['$data_key']"`
fi
echo "The Answer is :" 

