require 'spec_helper'

describe 'Cloud Drivers', :cloud do
  before(:all) do
    seek_and_destroy
  end

  context 'Local Mode' do
    %w( aws fog-aws ).each { |driver|
      it driver do
        results = metal_run("simplify::#{driver}")
        expect(results.error?).to be false
      end
    }
  end

after(:each) do |example|
  if example.exception
    FileUtils::cp('.chef/local-mode-cache/cache/chef-stacktrace.out', "results/#{example.full_description}-chef-stacktrace.out")
  end
end

  after(:all) do
    seek_and_destroy
  end
end

describe 'VM Drivers', :vm do
  before(:all) do
    seek_and_destroy
  end

  context 'Local Mode' do
    %w( vagrant ).each { |driver|
      it driver do
        results = metal_run("simplify::#{driver}")
        expect(results.error?).to be false
      end
    }
  end

after(:each) do |example|
  if example.exception
    FileUtils::cp('.chef/local-mode-cache/cache/chef-stacktrace.out', "results/#{example.full_description}-chef-stacktrace.out")
  end
end

  after(:all) do
    seek_and_destroy
  end
end


describe 'Container Drivers', :container do
  before(:all) do
    seek_and_destroy
  end

  context 'Local Mode' do
    %w( docker ).each { |driver|
      it driver do
        results = metal_run("simplify::#{driver}")
        expect(results.error?).to be false
      end
    }
  end

after(:each) do |example|
  if example.exception
    FileUtils::cp('.chef/local-mode-cache/cache/chef-stacktrace.out', "results/#{example.full_description}-chef-stacktrace.out")
  end
end

  after(:all) do
    seek_and_destroy
  end
end
