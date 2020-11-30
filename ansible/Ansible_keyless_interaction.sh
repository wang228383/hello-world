#!/bin/bash
#:auth:Wang
#time:2019-12-31
#Notice: Ansible keyless interaction
IP=`cat /etc/ansible/hosts | grep -Ev "#|$^" | grep -vE "[a-z]"`
#输入服务器密码
password="Syswin#123"

yum nstall sshpass ansible -y

ssh-keygen -t dsa   -f ~/.ssh/id_dsa -P ''

#fenfa
for i in ${IP[@]}
do
/usr/bin/sshpass -p${password} ssh-copy-id -oStrictHostKeyChecking=no ${i}
done 

if [ $? -eq 0 ];then
	echo "=============================免密成功=================================="
else
	echo "免密失败"
	exit 1 
fi


/usr/bin/ansible "*" -m ping
