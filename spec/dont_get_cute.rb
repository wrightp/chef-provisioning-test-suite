require 'spec_helper'

describe 'dont get cute' do
  context 'local chef zero' do

    %w( aws fog-aws vagrant ).each { |driver|
      it driver do
        chef_client = Mixlib::ShellOut.new("bundle exec chef-client -z -o dont-get-cute::#{driver} --force-formatter", shellout_options)
        chef_client.run_command
        expect(chef_client.error?).to be false
      end
    }
  end
end
