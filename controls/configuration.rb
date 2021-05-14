title 'RDS - Best Practise - Configuration'

## inputs
rds_name = input('rds_name')
rds_publicly_accessible = input('rds_publicly_accessible')
rds_engine = input('rds_engine')
rds_deletion_protection = input('rds_deletion_protection')
rds_auto_minor_version_upgrade = input('rds_auto_minor_version_upgrade')
rds_iam_database_authentication_enabled = input('rds_iam_database_authentication_enabled')
rds_performance_insights_enabled = input('rds_performance_insights_enabled')

control 'instance' do
  impact 1.0
  title 'instance exists'
  describe aws_rds_instance(rds_name) do
    it { should exist }
  end
end

control 'public' do
  impact 1.0
  title 'is instance publicly accessable'
  describe aws_rds_instance(rds_name) do
    its('publicly_accessible') { should eq rds_publicly_accessible }
  end
end

control 'rdms' do
  impact 1.0
  title 'engine type'
  describe aws_rds_instance(rds_name) do
    its('engine') { should eq rds_engine }
  end
end

control 'upgrades' do
  impact 1.0
  title 'auto upgrades'
  describe aws_rds_instance(rds_name) do
    its('auto_minor_version_upgrade')           { should eq rds_auto_minor_version_upgrade }
  end
end

control 'protection' do
  impact 1.0
  title 'deletion protection'
  describe aws_rds_instance(rds_name) do
    its('deletion_protection')                  { should eq rds_deletion_protection }
  end
end

control 'authentication' do
  impact 1.0
  title 'iam authentication'
  describe aws_rds_instance(rds_name) do
    its('iam_database_authentication_enabled')  { should eq rds_iam_database_authentication_enabled }
  end
end

control 'metrics' do
  impact 1.0
  title 'performance monitoring'
  describe aws_rds_instance(rds_name) do
    its('performance_insights_enabled')         { should eq rds_performance_insights_enabled }
  end
end

control 'tags' do
  impact 1.0
  title 'Has terraform created tags'
  describe aws_rds_instance(rds_name) do
    its('tags') { should include('Terraform' => 'true') }
  end
end
