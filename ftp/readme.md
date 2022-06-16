# Cmd from client:
How to use the ftp:
1. Modify the vsftpd.conf 
2. Run _sudo ./execute_ftp.sh

Curl cmds:
[Curl cmds](http://www.mukeshkumar.net/articles/curl/how-to-use-curl-command-line-tool-with-ftp-and-sftp)

## To upload 
curl -p --insecure  "ftp://192.168.3.1/ftp/ftp_server/" --user "dat:1" -T filename 

## To download: 
curl  -P --insecure "ftp://192.168.3.1/ftp/ftp_server/filename" --user "dat:1" 