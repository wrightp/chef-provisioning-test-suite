require 'chef_metal_fog'

with_driver 'fog:AWS'

machine_name = 'fog-aws-driver'

machine machine_name do
  files '/hello' => { :content => 'world' }
end

machine_execute "test `cat /hello` = 'world'" do
  machine machine_name
end

machine machine_name do
  action :destroy
end

raise 'expected node list to by empty' unless search(:node, "name:#{machine_name}").empty?
