aws ec2 describe-instances \
--instance-ids $(aws autoscaling describe-auto-scaling-groups \
    |jq -r '.AutoScalingGroups[]| select( .Tags[].Value == "nomad-example-client").Instances[].InstanceId' \
    |paste -s -d" ") \
| jq --arg address ${1} -r '.Reservations[].Instances[] | select(.PrivateIpAddress == $address).PublicIpAddress'
