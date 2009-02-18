require 'rubygems'

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'hoe'

require './lib/date_flag'

Hoe.new('date_flag', DateFlag::VERSION) do |p|
  p.developer('The Working Group', 'info@theworkinggroup.ca')
end

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the date_flag plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the date_flag plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'DateFlag'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

namespace :hoe do
  task :cultivate do
    system "touch Manifest.txt; rake check_manifest | grep -v \"(in \" | patch"
    system "rake debug_gem | grep -v \"(in \" > `basename \\`pwd\\``.gemspec"
  end
end