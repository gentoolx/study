#!/bin/bash
echo "install SSH daemon"
apt install openssh-server -y
echo "generate keys"

ssh-keygen -b 2048 -t rsa -f /root/.ssh/id_rsa -q -N ""
cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

echo "add existing key to ssh"
#cat /root/pubkey >> /root/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDSMnk338dmgUkmsl2SvPfWONvas8ToDH/ZXLFtJSTOKyM0oMNRdRSNzcqN8xdSBv0yGqYsrKvvuDok61a59wJqcZT3BERI2qvfAwTaiL513BMSNtfE+Qm96/0klPA0QvxSFxAaio5k58qT1WiSvkRgR117wByjClm7ohu1ytWGX9ZUKo+AoC6NU2TG489uqljGxe5OApOPGyYG1VU44IPn9CCLMTJC/mZXlHr3s2szV6W2YPTL7chS9KvLvSEBM1FlGHPjEfhwkF939lIJfOs+1RpcJh2VPByYfqLyfXxwdpizl9110eNL4JqhlH9jZRWgx/QmhTtSGFVCxVm/OB91 rsa-key-20211115
" >> /root/.ssh/authorized_keys

echo "allowing key login"

printf "PubkeyAuthentication yes \nAuthorizedKeysFile .ssh/authorized_keys\n" > /etc/ssh/sshd_config.d/pubkeys.conf

systemctl enable ssh
systemctl start ssh
