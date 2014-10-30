require 'chef_metal_vagrant'

with_driver 'vagrant'

vagrant_box 'precise64' do
  url 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/vmware/opscode_ubuntu-12.04_chef-provisionerless.box'
end

machine_name = 'vagrant-driver'

machine machine_name

machine machine_name do
  action :destroy
end
