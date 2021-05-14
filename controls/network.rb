title 'RDS - Best Practise - Network'

## inputs
region = input('region')
rds_name = input('rds_name')
rds_engine = input('rds_engine')
rds_security_group = input('rds_securitygroup')
rds_multi_az = input('rds_multi_az')

control 'instance port' do
  impact 1.0
  title 'instance port is not default'
  describe aws_rds_instance(rds_name) do
    its('db_instance_port') { should_not eq rds_helper.default_port(rds_engine) }
  end
end

control 'security_group' do
  impact 1.0
  title 'security_group assigned'
  describe aws_rds_instance(rds_name) do
    its('vpc_security_groups.first.vpc_security_group_id') { should eq rds_helper.get_security_group_id(rds_security_group, region) }
  end
end

control 'multi_az' do
  impact 1.0
  title 'instance has HA'
  describe aws_rds_instance(rds_name) do
    its('multi_az') { should eq rds_multi_az }
  end
end
