$: << '../lib'

require 'mixlib/shellout'

# this will all be moved to classes...
def metal_run(run_list)
  chef_client = Mixlib::ShellOut.new("bundle exec chef-client -z -o #{run_list} --force-formatter", shellout_options)
  chef_client.run_command
  return chef_client
end

def seek_and_destroy
  metal_run("simplify::destroy_all")
end

def clean
  chef_client = Mixlib::ShellOut.new("rm -rf .chef/chef-repo;rm -rf .chef/test-results;mkdir -p .chef/test-results", shellout_options)
  chef_client.run_command
end

private

# will move
STDOUT.sync = true
def shellout_options(options = {})
  default_options = { :live_stream => STDOUT }
  default_options.merge(options)
end

