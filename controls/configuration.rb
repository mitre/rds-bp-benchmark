title 'RDS - Best Practice - Configuration'

control 'instance' do
  impact 0.5
  tag nist: ['CM-6']
  tag severity: 'medium'
  title 'instance exists'
  describe aws_rds_instance(input('rds_name')) do
    it { should exist }
  end
end

control 'public' do
  impact 0.5
  tag nist: ['CM-6']
  tag severity: 'medium'
  title 'is instance publicly accessable'
  describe aws_rds_instance(input('rds_name')) do
    its('publicly_accessible') { should eq input('rds_publicly_accessible') }
  end
end

control 'rdms' do
  impact 0.5
  tag nist: ['CM-6']
  tag severity: 'medium'
  title 'engine type'
  describe aws_rds_instance(input('rds_name')) do
    its('engine') { should eq input('rds_engine') }
  end
end

control 'upgrades' do
  impact 0.5
  tag nist: ['CM-6']
  tag severity: 'medium'
  title 'auto upgrades'
  describe aws_rds_instance(input('rds_name')) do
    its('auto_minor_version_upgrade') { should eq input('rds_auto_minor_version_upgrade') }
  end
end

control 'protection' do
  impact 0.5
  tag nist: ['CM-6']
  tag severity: 'medium'
  title 'deletion protection'
  describe aws_rds_instance(input('rds_name')) do
    its('deletion_protection') { should eq input('rds_deletion_protection') }
  end
end

control 'authentication' do
  impact 0.5
  tag nist: ['CM-6']
  tag severity: 'medium'
  title 'iam authentication'
  describe aws_rds_instance(input('rds_name')) do
    its('iam_database_authentication_enabled') { should eq input('rds_iam_database_authentication_enabled') }
  end
end

control 'metrics' do
  impact 0.5
  tag nist: ['CM-6']
  tag severity: 'medium'
  title 'performance monitoring'
  describe aws_rds_instance(input('rds_name')) do
    its('performance_insights_enabled') { should eq input('rds_performance_insights_enabled') }
  end
end

control 'tags' do
  impact 0.5
  tag nist: ['CM-6']
  tag severity: 'medium'
  title 'has terraform created tags'
  describe aws_rds_instance(input('rds_name')) do
    its('tags') { should include('Terraform' => 'true') }
  end
end
