require 'spec_helper'

describe 'aws driver' do
  context 'local chef zero' do
    it 'runs machine converge' do
      chef_client = Mixlib::ShellOut.new("bundle exec chef-client -z -o chef-metal-driver::aws,chef-metal-test::create-metal1 --force-formatter", shellout_options)
      chef_client.run_command
      expect(chef_client.error?).to be false
    end

    # it 'created the machine' do
    # end

    it 'runs machine destroy' do
      chef_client = Mixlib::ShellOut.new("bundle exec chef-client -z -o chef-metal-driver::aws,chef-metal-test::destroy-metal1 --force-formatter", shellout_options)
      chef_client.run_command
      expect(chef_client.error?).to be false
    end

    # it 'destroyed the machine' do
    # end

  end
end
