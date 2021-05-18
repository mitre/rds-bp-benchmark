title 'RDS - Best Practice - Network'

control 'instance port' do
  impact 0.5
  tag nist: ['CM-6']
  tag severity: 'medium'
  title 'instance port is not default'
  describe aws_rds_instance(input('rds_name')) do
    its('db_instance_port') { should_not eq rds_helper.default_port(input('rds_engine')) }
  end
end

control 'security_group' do
  impact 0.5
  tag nist: ['CM-6']
  tag severity: 'medium'
  title 'security_group assigned'
  describe aws_rds_instance(input('rds_name')) do
    its('vpc_security_groups.first.vpc_security_group_id') { should eq rds_helper.get_security_group_id(input('rds_securitygroup'), input('region')) }
  end
end

control 'multi_az' do
  impact 0.5
  tag nist: ['CM-6']
  tag severity: 'medium'
  title 'instance has HA'
  describe aws_rds_instance(input('rds_name')) do
    its('multi_az') { should eq input('rds_multi_az') }
  end
end
