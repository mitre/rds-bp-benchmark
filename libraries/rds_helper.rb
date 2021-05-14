class RdsHelper < Inspec.resource(1)
  name 'rds_helper'

  desc "
    A resource to retrieve and resolve rds configuration info
  "
  def test_fun
    return 'this does nothing but its loaded into inspec'
  end
  
  def get_security_group_id(name, region)
    # puts "Name:    #{name}"
    # puts "region:  #{region}"
    output = ''
    ec2_client = Aws::EC2::Client.new(region: region)
    response = ec2_client.describe_security_groups
    response.security_groups.each do |sg|
      if sg.group_name == name
        output = sg.group_id
      end
    end
    if output == ''
      return 'No object found with Name: #{name} in Region: #{region}'
    else
      return output
    end
  end

  def default_port(rds_engine)
    db_port = case rds_engine
              when 'postgres' then 5432
              when 'sql server' then 1433
              when 'mysql' then 3306
              else 0
              end
  end
end
