require 'chef_metal_vagrant'

with_driver 'vagrant'

# Why can't I get attributes to load? undefined method `[]' for nil:NilClass
# vagrant_box node['chef-metal-driver']['vagrant']['box']['name'] do
#   url node['chef-metal-driver']['vagrant']['box']['url']
# end

vagrant_box 'precise64' do
  url 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/vmware/opscode_ubuntu-12.04_chef-provisionerless.box'
end
