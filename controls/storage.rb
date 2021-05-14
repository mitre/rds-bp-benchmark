title 'RDS - Best Practise - Storage'

# inputs
rds = input('rds_name')
rds_allocated_storage = input('rds_allocated_storage')
rds_copy_tags_to_snapshot = input('rds_copy_tags_to_snapshot')
rds_storage_encrypted = input('rds_storage_encrypted')

control 'encrypted storage' do
  impact 1.0
  title 'storage encrypted is on'
  describe aws_rds_instance(rds) do
    its('storage_encrypted')       { should eq rds_storage_encrypted }
  end
end

control 'allocated_storage' do
  impact 1.0
  title 'necessary allocated storage provided'
  describe aws_rds_instance(rds) do
    its('allocated_storage')       { should eq rds_allocated_storage }
  end
end

control 'snapshot tags' do
  impact 1.0
  title 'tags are copied to snapshots'
  describe aws_rds_instance(rds) do
    its('copy_tags_to_snapshot')   { should eq rds_copy_tags_to_snapshot }
  end
end
