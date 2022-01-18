chmod +x ./jq
./jq --null-input \
    --arg id "`id`" \
    --arg printenv "`printenv`" \
    --arg os "`cat /etc/issue`" \
    --arg hostname "`hostname`" \
    --arg processes "`ps -aux`" \
    --arg mounts "`mount`" \
    --arg tools "`which awk perl python ruby gcc cc vi vim nmap find netcat nc wget tftp ftp 2>/dev/null`" \
    --arg curl-google "`curl google.com`"
    '{"id": $id, "env": $printenv, "os": $os, "hostname": $hostname, "processes": $processes, "mounts": $mounts, "tools": $tools, "curl-google": $curlgoogle}'


# printf '{"whoami": "%q", "env": "%q"}' "`whoami`"  "`printenv`"