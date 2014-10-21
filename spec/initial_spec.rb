require 'mixlib/shellout'

describe 'vagrant driver' do
  context 'running chef zero' do
    it 'cycles through machine actions' do
      # to shell out or not to shell out (use client api)
      STDOUT.sync = true
      chef_client = Mixlib::ShellOut.new("chef-client -z spec/cookbooks/chef-server-type/recipes/zero.rb spec/cookbooks/chef-metal-driver/recipes/vagrant.rb spec/cookbooks/chef-metal-test/recipes/cycle-actions.rb --force-formatter", { :live_stream => STDOUT })
      chef_client.run_command
    end
  end
end
