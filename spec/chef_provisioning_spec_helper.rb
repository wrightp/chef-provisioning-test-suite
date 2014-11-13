require 'spec_helper'

# Configure a clean environment before starting the tests
# and cleans up after itself.  We don't want instances running
# afterward.
#
# Test results and node data is cleaned up before starting a new spec.
# Eventually this will upload test artifacts as well.
RSpec.configure do |config|
  config.before(:all) do
    seek_and_destroy
    clean_up_artifacts
  end
  
  config.after(:each) do |example|
    FileUtils::cp('.chef/local-mode-cache/cache/chef-stacktrace.out', 
      "./test-results/#{example.full_description}-chef-stacktrace.out") if example.exception
  end

  config.after(:all) do
    seek_and_destroy
  end
end

# Simplify chef-provisioning client run
# @param run_list [String] run list to execute
def metal_run(run_list)
  chef_client = Mixlib::ShellOut.new("bundle exec chef-client -z -o #{run_list} --force-formatter", shellout_options)
  chef_client.run_command
  return chef_client
end

# Use greedy node search to delete all machines
def seek_and_destroy
  metal_run("utility::destroy_all")
end

# Delete chef-repo and test results
def clean_up_artifacts
  chef_client = Mixlib::ShellOut.new("rm -rf ./chef-repo/*;rm -rf ./test-results/*", shellout_options)
  chef_client.run_command
end

private

def shellout_options(options = {})
  default_options = { :live_stream => STDOUT }
  default_options.merge(options)
end
