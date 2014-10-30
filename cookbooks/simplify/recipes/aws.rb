require 'chef_metal_aws'

with_driver 'aws'

machine_name = 'aws-driver'

machine machine_name

machine machine_name do
  action :destroy
end
