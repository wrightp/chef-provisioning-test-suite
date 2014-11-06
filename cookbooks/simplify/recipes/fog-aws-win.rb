require 'chef/provisioning/fog_driver/driver'

with_driver 'fog:AWS'

machine_name = 'fog-aws-driver-win'

# broken... timeouts.
with_data_center 'us-west-2' do
  machine machine_name do
    machine_options :bootstrap_options => {
      :image_id => 'ami-21f0bc11',
      :instance_type => 't1.micro'
    }
    #files '/hello' => { :content => 'world' }
  end

  ## what's the win equiv to these tests?
  # machine_execute "test `cat /hello` = 'world'" do
  #   machine machine_name
  # end

  machine machine_name do
    action :destroy
  end
end

raise 'expected node list to be empty' unless search(:node, "name:#{machine_name}").empty?
