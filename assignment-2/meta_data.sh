#!/bin/bash   
    json_meta_data=`curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | python -c "import json,sys; print json.loads(sys.stdin.read())"`
     echo $json_meta_data

