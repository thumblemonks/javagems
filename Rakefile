require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "javagems"
    gem.executables << "javagem"
    gem.executables << "javagem-exec"
    gem.summary = %Q{A gem for the javagems system}
    gem.description = %Q{Provides gem-esque support to Java}
    gem.email = "gabriel.gironda@gmail.com"
    gem.homepage = "http://www.javagems.org/"
    gem.authors = ["gabrielg", "jaknowlden"]
    gem.add_dependency "gemcutter"
    gem.add_dependency "jeweler"
    gem.add_dependency "bundler"
    gem.add_dependency "cmdparse"
    gem.add_development_dependency "riot"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

task :test => [:check_dependencies, :test_non_mutating, :test_mutating]
task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "javagems #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'rake/testtask'
Rake::TestTask.new(:test_non_mutating) do |test|
  test.libs << 'lib' << 'test'
  test.test_files = FileList['test/**/*_test.rb'].exclude('gem_overrides_test.rb')
  test.verbose = true
end

Rake::TestTask.new(:test_mutating) do |test|
  test.libs << 'lib' << 'test'
  test.test_files = ['test/gem_overrides_test.rb']
  test.verbose = true
end
