desc "Using the AWS SDK to terminate instances with tag 'chef-provisioning-test'"
task :aws_terminate do
  require 'aws-sdk-v1'

  TAG_NAME = 'chef-provisioning-test'

  # create ec2 interface
  # Assumes AWS auth environment variables are set
  ec2 = AWS.ec2

  # query for all instances matching the tag name
  resp = ec2.client.describe_tags(filters: [{ name: 'key', values: [TAG_NAME] }])

  # collect the instances ids
  ids = resp[:tag_set].collect { |t| t[:resource_id] }

  # print to user
  if ids.empty?
    puts "No resource ids found with tag #{TAG_NAME}. No action to take."
    exit
  else
    puts "Found resource ids with tag #{TAG_NAME}."
    ids.each do |i|
      puts i + "\n"
    end
  end

  # attempt instance termination
  begin 
    resp = ec2.client.terminate_instances(options = { :instance_ids => ids })
  rescue AWS::EC2::Errors => e
    puts e
    abort("Something went wrong terminating the instances.")
  end

  # calling it good
  puts "Instances terminated."

  exit
end
