require 'spec_helper'

describe 'fog aws driver' do
  context 'local chef zero' do
    it 'cycles through machine actions' do
      chef_client = Mixlib::ShellOut.new("bundle exec chef-client -z -o chef-metal-driver::fog-aws,chef-metal-test::cycle-actions --force-formatter", shellout_options)
      chef_client.run_command
      expect(chef_client.error?).to be false
    end

  context 'at hosted' do
    it 'cycles through machine actions' do
      chef_client = Mixlib::ShellOut.new("bundle exec chef-client -z -o chef-server-type::hosted,chef-metal-driver::fog-aws,chef-metal-test::cycle-actions --force-formatter", shellout_options)
      chef_client.run_command
      expect(chef_client.error?).to be false
    end
  end
end
