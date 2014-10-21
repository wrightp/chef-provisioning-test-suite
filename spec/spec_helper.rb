require 'mixlib/shellout'

# I'll likely move this some where else soon
STDOUT.sync = true
def shellout_options(options = {})
  default_options = { :live_stream => STDOUT }
  default_options.merge(options)
end
