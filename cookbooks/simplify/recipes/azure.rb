require 'chef_metal_azure'

with_driver 'azure'

machine_name = 'azure-driver'

machine machine_name

machine machine_name do
  action :destroy
end

raise 'expected node list to be empty' unless search(:node, "name:#{machine_name}").empty?

