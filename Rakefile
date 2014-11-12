Dir.glob('lib/tasks/*.rake').each { |r| import r }

desc "[Default] Force bundling from master"
task :bundle do
  sh('rm Gemfile.lock && bundle install --binstubs')
end
task :default => :bundle

desc "Run utlity destroy all machines recipe with chef-provisioning"
task :destroy_all do
  sh('bundle exec chef-client -z -o utility::destroy_all')
end

desc "Build lib and spec yard doc"
task :yardoc do
  sh('bundle exec yardoc spec/* lib/*')
end

desc "Start default yard server"
task :yard_server do
  sh('bundle exec yard server')
end
