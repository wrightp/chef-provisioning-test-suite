require 'mixlib/shellout'

describe 'vagrant driver' do
  STDOUT.sync = true
  shellout_options = { :live_stream => STDOUT }
  context 'running chef zero' do
    it 'cycles through machine actions' do
      # to shell out or not to shell out (use client api)
      chef_client = Mixlib::ShellOut.new("chef-client -z spec/cookbooks/chef-server-type/recipes/zero.rb spec/cookbooks/chef-metal-driver/recipes/vagrant.rb spec/cookbooks/chef-metal-test/recipes/cycle-actions.rb --force-formatter", shellout_options)
      chef_client.run_command
      expect(chef_client.error?).to be false
    end

    it 'hates you' do
      chef_client = Mixlib::ShellOut.new("chef-client -z spec/cookbooks/chef-server-type/recipes/zero.rb spec/cookbooks/chef-metal-driver/recipes/vagrant.rb spec/cookbooks/chef-metal-test/recipes/cycle-actions1.rb --force-formatter", shellout_options)
      chef_client.run_command
      expect(chef_client.error?).to be true
    end
  end
end
