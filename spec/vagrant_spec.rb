require 'spec_helper'

describe 'vagrant driver' do
  context 'running chef zero' do
    it 'cycles through machine actions' do
      # to shell out or not to shell out (use client api)
      chef_client = Mixlib::ShellOut.new("bundle exec chef-client -z -o chef-metal-driver::vagrant,chef-metal-test::cycle-actions --force-formatter", shellout_options)
      chef_client.run_command
      expect(chef_client.error?).to be false
    end

    it 'hates you' do
      chef_client = Mixlib::ShellOut.new("bundle exec chef-client -z -o chef-metal-driver::vagrant,chef-metal-test::boo --force-formatter", shellout_options)
      chef_client.run_command
      # need to catch the Chef client error
      expect(chef_client.error?).to be true
    end
  end
end
