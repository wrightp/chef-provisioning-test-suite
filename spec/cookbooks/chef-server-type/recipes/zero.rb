require 'chef_metal'

# generated path provided by rspec test
path = '/tmp/chef-metal-test-suite'

directory path

with_chef_local_server :chef_repo_path => path
