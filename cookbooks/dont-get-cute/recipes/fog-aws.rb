require 'chef_metal_fog'

with_driver 'fog:AWS'

machine_name = 'fog-aws-driver'

machine machine_name

aws_node = search(:node, "name:#{machine_name}").first

execute 'netcat ok' do
  command "nc -vz #{aws_node['ec2']['public_hostname']} 22"
  retries 60
end

machine machine_name do
  action :destroy
end

execute 'netcat fail' do
  command "nc -vz #{aws_node['ec2']['public_hostname']} 22"
  retries 60
  returns 1
end
