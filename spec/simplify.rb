require 'spec_helper'

describe 'Local Mode', :local => true do # will change to :mode => :local or something similar
  before(:all) do
    seek_and_destroy
    clean
  end

  context 'Cloud Drivers', :cloud do
    # aws last, open issue where keys are not generated
    %w( fog-aws fog-aws-win aws ).each { |driver|
      it driver do
        results = metal_run("simplify::#{driver}")
        expect(results.error?).to be false
      end
    }
  end

  context 'VM Drivers', :vm do
    %w( vagrant ).each { |driver|
      it driver do
        results = metal_run("simplify::#{driver}")
        expect(results.error?).to be false
      end
    }
  end

  context 'Container Drivers', :container do
    %w( docker ).each { |driver|
      it driver do
        results = metal_run("simplify::#{driver}")
        expect(results.error?).to be false
      end
    }
  end

  after(:each) do |example|
    if example.exception
      FileUtils::cp('.chef/local-mode-cache/cache/chef-stacktrace.out', ".chef/test-results/#{example.full_description}-chef-stacktrace.out")
    end
  end

  after(:all) do
    seek_and_destroy
  end
end
