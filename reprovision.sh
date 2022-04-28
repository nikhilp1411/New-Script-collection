#!/bin/bash
IFS=","
user="ADDusername"
pswd="AddDBpassword"
host="ADDhost"

ORANGE="\e[33m"
BLUE="\e[94m"
GREEN="\e[92m"
Stop='\e[0m'

while read domain_name account_number email


do

id=$(mysql -u$user -p$pswd -h$host -se "use nikhil;select id from user where domain_name='${domain_name}' and account_number=${account_number}")

acc_db=$(mysql -u$user -p$pswd -h$host -se "use nikhil;select account_number from user where domain_name='${domain_name}' and account_number=${account_number}")

mysql -u$user -p$pswd -h$host -se "use nikhil;update user set email='$email' where id=$id and domain_name='${domain_name}' and account_number=${account_number}"

if [[ $? -eq 0 ]]; then

new_email=$(mysql -u$user -p$pswd -h$host -se "use nikhil;select email from user where domain_name='${domain_name}' and account_number=${account_number}")

echo -e "New email has been update for account number "${BLUE}"\033[1m$acc_db\033[0m"${STOP}" -> "${GREEN}"\033[1m$new_email\033[0m"${STOP}""

fi

done < csv file path 2>/dev/null 
