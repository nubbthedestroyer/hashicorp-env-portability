aws ec2 describe-instances \
--instance-ids $(aws autoscaling describe-auto-scaling-groups \
    |jq -r '.AutoScalingGroups[]| select( .Tags[].Value == "consul-example-server").Instances[].InstanceId' \
    |paste -s -d" ") \
| jq -r '.Reservations[].Instances[].PublicIpAddress' | head -1
