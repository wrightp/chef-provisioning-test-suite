require 'chef_metal_fog'

with_driver 'fog:AWS'

machine_name = 'fog-aws-driver'

machine machine_name

aws_node = search(:node, "name:#{machine_name}").first

netcat = "nc -vz #{aws_node['ec2']['public_hostname']} 22"

execute netcat do
  retries 60
end

machine machine_name do
  action :destroy
end

execute netcat do
  retries 60
  returns 1
end
