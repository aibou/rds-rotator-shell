aws rds delete-db-instance                        \
  --db-instance-identifier ${instance_identifier} \ 
  --skip-final-snapshot

aws rds restore-db-instance-from-db-snapshot      \ 
  --db-instance-identifier ${instance_identifier} \
  --db-snapshot-identifier ${snapshot_identifier} \
  --db-instance-class      ${instance_class}      \
  --db-subnet-group-name   ${subnet_group_name}   \
  --no-multi-az                                   \ 
  --publicly-accessible

aws rds modify-db-instance                        \
  --db-instance-identifier ${instance_identifier} \
  --vpc-security-group-ids ${security_group_id}   \
  --db-parameter-group-name ${parameter_group}    \
  --apply-immediately

aws rds reboot-db-instance \
  --db-instance-identifier ${instance_identifier}
