require 'mixlib/cli'

module ChefMetalTestSuite
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
      ChefMetalTestSuite::Config.test_recipes = cli_arguments if cli_arguments
      ChefMetalTestSuite::Config.merge!(config)
    end
  end
end
