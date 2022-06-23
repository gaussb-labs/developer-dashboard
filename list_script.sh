public_ip=($(aws ec2 describe-instances --query "Reservations[*].Instances[*].PublicIpAddress" --output=text))

echo ${public_ip[*]}