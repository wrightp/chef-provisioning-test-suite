task :default do
  sh('rm Gemfile.lock && bundle install --binstubs')
end

task :destroy_all do
  sh('bundle exec chef-client -z -o utility::destroy_all')
end

task :yardoc do
  sh('bundle exec yardoc spec/* lib/*')
end

task :yard_server do
  sh('bundle exec yard server')
end
