require 'chef/provisioning/fog_driver/driver'

with_driver 'aws'

machine_name = 'aws-driver'

machine machine_name do
  machine_options :bootstrap_options => {
    :key_name => 'chef_default'
  }
  files '/hello' => { :content => 'world' }
end

# ## this will fail because connect_to_machine is not implmented ^^
machine_execute "test `cat /hello` = 'world'" do
  machine machine_name
end

machine machine_name do
  action :destroy
end

## this will fail because aws driver is not removing local data
raise 'expected node list to be empty' unless search(:node, "name:#{machine_name}").empty?
