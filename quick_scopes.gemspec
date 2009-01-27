# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{quick_scopes}
  s.version = "0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrew Timberlake"]
  s.date = %q{2009-01-27}
  s.email = %q{andrew@andrewtimberlake.com}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc", "LICENSE", "Rakefile", "lib/quick_scopes.rb", "test/helper.rb", "test/models.rb", "test/test.sqlite3", "test/test_quick_scopes.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://www.internuity.net/projects/quick_scopes}
  s.rdoc_options = ["--line-numbers", "--inline-source"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Rails plugin to add some useful named_scopes to your models}
  s.test_files = ["test/test_quick_scopes.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
  end
end
