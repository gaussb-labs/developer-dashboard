#!/bin/sh
public_ip=($(aws ec2 describe-instances --query "Reservations[*].Instances[*].PublicIpAddress" --output=text))

echo ${public_ip[*]}

ssh-copy-id -i ~/.ssh/users_keys/id_rsa_arihant.pub ubuntu@${public_ip[1]}

