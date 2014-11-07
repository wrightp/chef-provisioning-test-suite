task :default do
  sh('rm Gemfile.lock && bundle install --binstubs')
end

task :destroy_all do
  sh('bundle exec chef-client -z -o utility::destroy_all')
end
