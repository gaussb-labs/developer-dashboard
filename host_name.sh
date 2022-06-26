host_name=($(aws ec2 describe-instances --query 'Reservations[].Instances[].[PublicIpAddress,Tags[?Key==`Name`]| [0].Value]' --output text))
echo ${host_name[*]}