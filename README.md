# rolling_Pcaps
Bash script to create rolling Pcaps and move them to an external hard drive.

File Locations:
fpc.service - /lib/systemd/system/
fpc.conf - /etc/init/
scripts - /scripts/

Enable the service:
$ systemctl enable fpc

To run a cronjob
$ sudo crontab -e
Insert the following line for it to run every 5 minutes
*/5 * * * *     /scripts/move_pcap_new.sh
