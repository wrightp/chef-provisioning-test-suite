require 'mixlib/config'

module ChefMetalTestSuite
  module Config
    extend Mixlib::Config

    config_strict_mode true

    default :server_type, :zero

    default :metal_driver, :vagrant

    default :platform, :ubuntu

    default :platform_version, '14.04'

    default :test_recipes, []

    def validate
      # server_type
      [:zero, :server, :hosted]

      # driver
      [:vagrant, :fog, :aws]

      # os platform / version
      {
        :ubuntu => ['10.04', '12.04', '14.04'],
        :centos => ['5', '6', '7'],
        :windows => ['2012']
      }
    end

    def save
      # to data bag
    end
  end
end
