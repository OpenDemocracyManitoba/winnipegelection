require 'rubygems'
require 'rake'
require 'yaml'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "paged_scopes"
    gem.summary = <<-EOF
PagedScopes is an ActiveRecord pagination gem. It lets you easily paginate collection associations and
named scopes. It also paginates collections which already have :limit and :offset scopes in place. You
can also find the page containing a given object in a collection, and find the next and previous objects
for each object in the collection.
EOF
    gem.email = "mdholling@gmail.com"
    gem.homepage = "http://github.com/mholling/paged_scopes"
    gem.authors = ["Matthew Hollingworth"]
    gem.add_dependency 'activerecord', ">= 2.2.1"
    gem.has_rdoc = false
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end


task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION.yml')
    config = YAML.load(File.read('VERSION.yml'))
    version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "paged_scopes #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

