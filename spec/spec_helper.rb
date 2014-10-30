$: << '../lib'

require 'mixlib/shellout'

def metal_run(run_list)
  chef_client = Mixlib::ShellOut.new("bundle exec chef-client -z -o #{run_list} --force-formatter", shellout_options)
  chef_client.run_command
  return chef_client
end

def seek_and_destroy
  metal_run("dont-get-cute::destroy_all")
end

private

# will move
STDOUT.sync = true
def shellout_options(options = {})
  default_options = { :live_stream => STDOUT }
  default_options.merge(options)
end

