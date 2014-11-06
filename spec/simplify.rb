require 'spec_helper'

describe 'Local Mode' do #, :server_type => 'zero' do # will change to :mode => :local or something similar
  before(:all) do
    seek_and_destroy
    clean
  end

  context 'Cloud Drivers', :driver_family => 'cloud' do
    it 'fog-aws', :driver => 'fog' do
      expect(metal_run("simplify::fog-aws").error?).to be false
    end

    it 'fog-aws-win', :driver => 'fog', :windows => true do
      expect(metal_run("simplify::fog-aws-win").error?).to be false
    end

    # aws last, open issue where keys are not generated
    it 'aws', :driver => 'aws' do
      expect(metal_run("simplify::aws").error?).to be false
    end
  end

  context 'VM Drivers', :driver_family => 'vm' do
    it 'vagrant', :driver => 'vagrant' do
      expect(metal_run("simplify::vagrant").error?).to be false
    end
  end

  context 'Container Drivers', :driver_family => 'container' do
    it 'docker', :driver => 'docker' do
      expect(metal_run("simplify::docker").error?).to be false
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
