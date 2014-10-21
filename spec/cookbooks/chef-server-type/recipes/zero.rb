require 'chef_metal'

path = '/tmp/chef-metal-test-suite'

directory path

with_chef_local_server :chef_repo_path => path
