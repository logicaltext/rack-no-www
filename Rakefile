require "bundler"
Bundler.setup

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec)

gemspec = eval(File.read("rack-no-www.gemspec"))

task :build => "#{gemspec.full_name}.gem"

file "#{gemspec.full_name}.gem" => gemspec.files + ["rack-no-www.gemspec"] do
  system "gem build rack-no-www.gemspec"
  system "gem install rack-no-www-#{Rack::NoWWW::VERSION}.gem"
end
