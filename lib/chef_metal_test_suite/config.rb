require 'mixlib/config'

module ChefMetalTestSuite
  module Config
    extend Mixlib::Config

    config_strict_mode true

    default :server_type, :zero

    default :metal_driver, :vagrant

    default :test_recipes, []

    def validate
      #server_type.include? [:zero, :server, :hosted]
    end
  end
end
