title 'RDS - Best Practice - Storage'

control 'encrypted storage' do
  impact 0.5
  tag nist: ['CM-6']
  tag severity: 'medium'
  title 'storage encrypted is on'
  describe aws_rds_instance(input('rds_name')) do
    its('storage_encrypted') { should eq input('rds_storage_encrypted') }
  end
end

control 'allocated_storage' do
  impact 0.5
  tag nist: ['CM-6']
  tag severity: 'medium'
  title 'necessary allocated storage provided'
  describe aws_rds_instance(input('rds_name')) do
    its('allocated_storage') { should eq input('rds_allocated_storage') }
  end
end

control 'snapshot tags' do
  impact 0.5
  tag nist: ['CM-6']
  tag severity: 'medium'
  title 'tags are copied to snapshots'
  describe aws_rds_instance(input('rds_name')) do
    its('copy_tags_to_snapshot') { should eq input('rds_copy_tags_to_snapshot') }
  end
end
