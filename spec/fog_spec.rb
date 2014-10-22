require 'spec_helper'

describe 'fog ec2 driver' do
  context 'running chef zero' do
    it 'cycles through machine actions' do
      chef_client = Mixlib::ShellOut.new("bundle exec chef-client -z cookbooks/chef-server-type/recipes/zero.rb cookbooks/chef-metal-driver/recipes/fog_ec2.rb cookbooks/chef-metal-test/recipes/cycle-actions.rb --force-formatter", shellout_options)
      chef_client.run_command
      expect(chef_client.error?).to be false
    end
  end
end
