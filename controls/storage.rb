title 'RDS - Best Practise - Storage'

# inputs
rds = input('rds_name')
rds_allocated_storage = input('rds_allocated_storage')
rds_copy_tags_to_snapshot = input('rds_copy_tags_to_snapshot')
rds_storage_encrypted = input('rds_storage_encrypted')

control 'RDS-BP-02' do
  impact 1.0
  title 'Standard storage checks'
  describe aws_rds_instance(rds) do
    its('storage_encrypted')       { should eq rds_storage_encrypted }
    its('allocated_storage')       { should eq rds_allocated_storage }
    its('copy_tags_to_snapshot')   { should eq rds_copy_tags_to_snapshot }
  end
end
