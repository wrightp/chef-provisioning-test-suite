require 'chef_metal_vagrant'

with_driver 'vagrant'

# configurable 
box = {:name => 'precise64', 
        :url => 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/vmware/opscode_ubuntu-12.04_chef-provisionerless.box' }

vagrant_box box[:name] do
  url box[:url]
end
