# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{date_flag}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["The Working Group"]
  s.date = %q{2009-02-18}
  s.description = %q{This is a date flag method for ActiveRecord models.}
  s.email = ["info@theworkinggroup.ca"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "date_flag.gemspec", "init.rb", "install.rb", "lib/date_flag.rb", "tasks/date_flag_tasks.rake", "test/date_flag_test.rb", "test/test_helper.rb", "uninstall.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://theworkinggroup.ca/}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{date_flag}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{This is a date flag method for ActiveRecord models.}
  s.test_files = ["test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 1.8.3"])
    else
      s.add_dependency(%q<hoe>, [">= 1.8.3"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.8.3"])
  end
end
