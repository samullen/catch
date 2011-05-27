require 'bundler'
require 'rake/testtask'

lib_dir = File.expand_path('lib')
test_dir = File.expand_path('test')

Bundler::GemHelper.install_tasks

desc "Run the test suite"
Rake::TestTask.new(:test) do |test|
  test.libs = [lib_dir, test_dir]
  test.pattern = 'test/**/*rb'
end
