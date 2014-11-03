local_mode true
config_dir "#{File.expand_path('..', __FILE__)}/"
project_dir "#{File.expand_path('..', config_dir)}/"
repo = File.join(config_dir, 'chef-repo')
FileUtils.mkdir_p(repo)
chef_repo_path repo
cookbook_path [
    File.join(project_dir, 'cookbooks')
  ]
