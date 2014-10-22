require 'spec_helper'
require 'chef_metal_test_suite/cli'
require 'chef_metal_test_suite/config'

describe ChefMetalTestSuite::Cli do
  it "defaults" do
    cli = ChefMetalTestSuite::Cli.new
    cli.run
    expect(ChefMetalTestSuite::Config.metal_driver).to eq(:vagrant)
  end

  it "overrides config" do
    cli = ChefMetalTestSuite::Cli.new
    ARGV = ['-d', 'fog']
    cli.run
    expect(ChefMetalTestSuite::Config.metal_driver).to eq(:fog)
  end

end
