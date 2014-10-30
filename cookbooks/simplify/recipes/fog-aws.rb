require 'chef_metal_fog'

with_driver 'fog:AWS'

machine_name = 'fog-aws-driver'

machine machine_name

machine machine_name do
  action :destroy
end
