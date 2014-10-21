require 'chef_metal'

# generated path provided by rspec test
repo_path = '/tmp/chef-metal-test-suite'

directory repo_path

with_chef_local_server :chef_repo_path => repo_path
