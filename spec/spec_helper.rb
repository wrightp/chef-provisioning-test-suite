$: << '../lib'

require 'mixlib/shellout'

# will move
STDOUT.sync = true
def shellout_options(options = {})
  default_options = { :live_stream => STDOUT }
  default_options.merge(options)
end
