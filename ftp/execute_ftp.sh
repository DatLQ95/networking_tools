cp ~/ftp/vsftpd.conf /etc/vsftpd.conf

usermod -d ~/ftp/ftp_server ftp

systemctl stop vsftpd

systemctl start vsftpd

systemctl enable vsftpd

