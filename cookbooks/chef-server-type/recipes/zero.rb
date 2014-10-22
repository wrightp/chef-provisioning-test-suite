require 'chef_metal'

repo_path = File.join(File.dirname(__FILE__), '..', '..', '..')

with_chef_local_server :chef_repo_path => repo_path
