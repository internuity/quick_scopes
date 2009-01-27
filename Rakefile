require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/gempackagetask'

desc 'Default: run unit tests.'
task :default => [:clean, :test]

desc 'Run tests'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/test_*.rb'
  t.verbose = true
end

desc 'Generate documentation.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title    = 'Quick Scopes'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc 'Clean up files.'
task :clean do |t|
  FileUtils.rm_rf "doc"
  FileUtils.rm_rf "tmp"
  FileUtils.rm_rf "pkg"
end

spec = Gem::Specification.new do |s| 
  s.name              = "quick_scopes"
  s.version           = "0.2"
  s.author            = "Andrew Timberlake"
  s.email             = "andrew@andrewtimberlake.com"
  s.homepage          = "http://www.internuity.net/projects/quick_scopes"
  s.platform          = Gem::Platform::RUBY
  s.summary           = "Rails plugin to add some useful named_scopes to your models"
  s.files             = FileList["README*",
                                 "LICENSE",
                                 "Rakefile",
                                 "{lib,test}/**/*"].to_a
  s.require_path      = "lib"
  s.test_files        = FileList["test/**/test_*.rb"].to_a
  s.has_rdoc          = true
  s.extra_rdoc_files  = FileList["README*"].to_a
  s.rdoc_options << '--line-numbers' << '--inline-source'
  s.add_development_dependency 'thoughtbot-shoulda'
end

desc "Generate a gemspec file for GitHub"
task :gemspec do
  File.open("#{spec.name}.gemspec", 'w') do |f|
    f.write spec.to_ruby
  end
end
