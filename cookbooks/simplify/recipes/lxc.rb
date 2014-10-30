require 'chef_metal_lxc'

with_driver 'lxc'

machine_name = 'lxc-driver'

machine machine_name

machine machine_name do
  action :destroy
end
