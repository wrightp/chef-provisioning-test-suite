config_dir File.dirname(__FILE__)
chef_repo_path File.join(config_dir, '..')
cookbook_path [ File.join(config_dir, '..', 'cookbooks'),
                File.join(config_dir, '..', 'berks-cookbooks') ]
cache_path File.join(config_dir, 'local-mode-cache')
