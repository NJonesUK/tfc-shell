./jq --null-input \
    --arg whoami "`whoami`" \
    --arg printenv "`printenv`" \
    --arg os "`cat /etc/issue`" \
    --arg hostname "`hostname`" \
    --arg processes "`ps -aux`" \
    --arg mounts "`mount`" \
    --arg tools "`which awk perl python ruby gcc cc vi vim nmap find netcat nc wget tftp ftp 2>/dev/null`" \
    '{"whoami": $whoami, "env": $printenv, "os": $os, "hostname": $hostname, "processes": $processes, "mounts": $mounts, "tools": $tools}'


# printf '{"whoami": "%q", "env": "%q"}' "`whoami`"  "`printenv`"