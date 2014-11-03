require 'chef/provisioning/vagrant_driver/driver'

with_driver 'vagrant'

vagrant_box 'precise64' do
  url 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/vmware/opscode_ubuntu-12.04_chef-provisionerless.box'
end

machine_name = 'vagrant-driver'

machine machine_name do
  files '/hello' => { :content => 'world' }
end

machine_execute "test `cat /hello` = 'world'" do
  machine machine_name
end

machine machine_name do
  action :destroy
end

raise 'expected node list to be empty' unless search(:node, "name:#{machine_name}").empty?
