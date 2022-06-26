#!/bin/sh
#public_ip=($(aws ec2 describe-instances --query "Reservations[*].Instances[*].PublicIpAddress" --output=text))
#
#echo ${public_ip[*]}

ssh-copy-id -i ~/.ssh/users_keys/id_rsa_premdeep.pub ubuntu@13.232.164.233

