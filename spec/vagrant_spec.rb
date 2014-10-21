require 'spec_helper'

describe 'vagrant driver' do
  context 'running chef zero' do
    it 'cycles through machine actions' do
      # to shell out or not to shell out (use client api)
      chef_client = Mixlib::ShellOut.new("chef-client -z cookbooks/chef-server-type/recipes/zero.rb cookbooks/chef-metal-driver/recipes/vagrant.rb cookbooks/chef-metal-test/recipes/cycle-actions.rb --force-formatter", shellout_options)
      chef_client.run_command
      expect(chef_client.error?).to be false
    end

    it 'hates you' do
      chef_client = Mixlib::ShellOut.new("chef-client -z cookbooks/chef-server-type/recipes/zero.rb cookbooks/chef-metal-driver/recipes/vagrant.rb cookbooks/chef-metal-test/recipes/boo.rb --force-formatter", shellout_options)
      chef_client.run_command
      expect(chef_client.error?).to be true
    end
  end
end
