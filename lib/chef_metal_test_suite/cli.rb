require 'mixlib/cli'

module ChefMetalTestSuite
  # Nothing to see here
  class Cli
    include Mixlib::CLI

    option :server_type,
      :short => '-s SERVER TYPE',
      :long => '--server-type SERVER TYPE',
      :default => :zero,
      :description => 'Chef Server Type',
      :proc => Proc.new { |s| s.to_sym }

    option :metal_driver,
      :short => '-d METAL DRIVER',
      :long => '--metal-driver METAL DRIVER',
      :default => :vagrant,
      :description => 'Chef Metal Driver',
      :proc => Proc.new { |d| d.to_sym }

    option :platform,
      :short => '-p PLATFORM',
      :long => '--plaftorm PLATFORM',
      :default => :ubuntu,
      :description => 'Operating System Plaftorm',
      :proc => Proc.new { |p| p.to_sym }

    option :platform_version,
      :short => '-pv PLATFORM VERSION',
      :long => '--platform-version PLATFORM VERSION',
      :default => '14.04',
      :description => 'Operating System Plaftorm Version'

    option :create_databag,
      :short => '-b',
      :long => '--create-databag',
      :boolean => true,
      :description => 'Writes the configuration to a local databag'

    option :help,
      :short => "-h",
      :long => "--help",
      :description => "Show this message",
      :on => :tail,
      :boolean => true,
      :show_options => true,
      :exit => 0

    def run(argv=ARGV)
      parse_options(argv)
      ChefMetalTestSuite::Config.test_recipes = cli_arguments
      ChefMetalTestSuite::Config.merge!(config)
      ChefMetalTestSuite::Config.validate(true)

      # This is ugly.  I've tried configuring Chef programmatically, but 
      # I still run into the issue of needing the config paths.  This
      # works with considerably less code.
      if config[:create_databag]
        require 'tempfile'
        require 'json'
        file = Tempfile.new(['test-config', '.json'])
        hash_config = ChefMetalTestSuite::Config.save(true)
        hash_config['id'] = 'test'
        file.write(hash_config.to_json)
        file.close

        knife = Mixlib::ShellOut.new("bundle exec knife data bag create config",  { :live_stream => STDOUT })
        knife.run_command
        knife = Mixlib::ShellOut.new("bundle exec knife data bag from file config #{file.path}",  { :live_stream => STDOUT })
        knife.run_command
      end
    end
  end
end
