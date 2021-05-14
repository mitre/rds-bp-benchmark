title 'RDS - Best Practise - Configuration'

## inputs
rds_name = input('rds_name')
rds_publicly_accessible = input('rds_publicly_accessible')
rds_engine = input('rds_engine')
rds_deletion_protection = input('rds_deletion_protection')
rds_auto_minor_version_upgrade = input('rds_auto_minor_version_upgrade')
rds_iam_database_authentication_enabled = input('rds_iam_database_authentication_enabled')
rds_performance_insights_enabled = input('rds_performance_insights_enabled')

control 'RDS-BP-01' do
  impact 1.0
  title 'Standard configuration checks'
  # exists
  describe aws_rds_instance(rds_name) do
    it                                          { should exist }
    its('publicly_accessible')                  { should eq rds_publicly_accessible }
    its('engine')                               { should eq rds_engine }
    its('auto_minor_version_upgrade')           { should eq rds_auto_minor_version_upgrade }
    its('deletion_protection')                  { should eq rds_deletion_protection }
    its('iam_database_authentication_enabled')  { should eq rds_iam_database_authentication_enabled }
    its('performance_insights_enabled')         { should eq rds_performance_insights_enabled }
    its('tags')                                 { should include('Terraform' => 'true') }
  end
end
