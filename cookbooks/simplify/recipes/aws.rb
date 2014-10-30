require 'chef_metal_aws'

with_driver 'aws'

machine_name = 'aws-driver'

machine machine_name #do
  # machine_options :bootstrap_options => {
  #   :key_name => 'metal_default'
  # }
#end

machine machine_name do
  action :destroy
end
