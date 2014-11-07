 require 'spec_helper'

describe 'Local Mode' do #, :server_type => 'zero' do # will change to :mode => :local or something similar
  before(:all) do
    seek_and_destroy
    clean
  end

  context 'Cloud Drivers', :driver_family => 'cloud' do
    it 'fog-aws', :driver => 'fog' do
      expect(metal_run("driver::fog-aws,test::create-destroy").error?).to be false
    end

    it 'fog-aws-win', :driver => 'fog', :windows => true do
      expect(metal_run("driver::fog-aws-windows,test::create-destroy").error?).to be false
    end

    it 'aws', :driver => 'aws' do
      expect(metal_run("driver::aws,test::create-destroy").error?).to be false
    end

    it 'aws-win', :driver => 'aws', :windows => true do
      expect(metal_run("driver::aws-windows,test::create-destroy").error?).to be false
    end

  end

  context 'VM Drivers', :driver_family => 'vm' do
    it 'vagrant', :driver => 'vagrant' do
      expect(metal_run("driver::vagrant,test::create-destroy").error?).to be false
    end
  end

  context 'Container Drivers', :driver_family => 'container' do
    it 'docker', :driver => 'docker' do
      # expect(metal_run("simplify::docker").error?).to be false
    end
  end

  after(:each) do |example|
    FileUtils::cp('.chef/local-mode-cache/cache/chef-stacktrace.out', 
      ".chef/test-results/#{example.full_description}-chef-stacktrace.out") if example.exception
  end

  after(:all) do
    seek_and_destroy
  end
end
