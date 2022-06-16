# Download kamailio! 

# Follow some steps to configure the kamailio/ database!
Follow this guy: https://nickvsnetworking.com/kamailio-101-part-8-security-in-practice/

# To add a new number into the database: 
kamctl add 1236 test3

# To view the number and password in database:
mysql -u kamailioro -p; (pw: kamailioro)
use kamailio;
SELECT * FROM subscriber.user;
