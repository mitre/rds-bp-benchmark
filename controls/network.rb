title 'RDS - Best Practise - Network'

## inputs
region = input('region')
rds_name = input('rds_name')
rds_engine = input('rds_engine')
rds_security_group = input('rds_securitygroup')
rds_multi_az = input('rds_multi_az')

control 'RDS-BP-03' do
  impact 1.0
  title 'Standard network checks'
  describe aws_rds_instance(rds_name) do
    its('db_instance_port')                                 { should_not eq rds_helper.default_port(rds_engine) }
    its('vpc_security_groups.first.vpc_security_group_id')  { should eq rds_helper.get_security_group_id(rds_security_group, region)}
    its('multi_az')                                         { should eq rds_multi_az }
  end
end