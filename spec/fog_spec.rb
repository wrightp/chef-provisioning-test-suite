require 'mixlib/shellout'

describe 'fog ec2 driver' do
  STDOUT.sync = true
  shellout_options = { :live_stream => STDOUT }
  context 'running chef zero' do
    it 'cycles through machine actions' do
      chef_client = Mixlib::ShellOut.new("chef-client -z spec/cookbooks/chef-server-type/recipes/zero.rb spec/cookbooks/chef-metal-driver/recipes/fog_ec2.rb spec/cookbooks/chef-metal-test/recipes/cycle-actions.rb --force-formatter", shellout_options)
      chef_client.run_command
      expect(chef_client.error?).to be false
    end
  end
end
