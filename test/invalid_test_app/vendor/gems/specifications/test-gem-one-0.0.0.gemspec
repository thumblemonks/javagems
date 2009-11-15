# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{test-gem-one}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["ggironda"]
  s.date = %q{2009-11-14}
  s.description = %q{TODO: longer description of your gem}
  s.email = %q{gabriel.gironda@centro.net}
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = [".document", ".gitignore", "LICENSE", "README.rdoc", "Rakefile", "VERSION", "lib/test-gem-one.rb", "test/helper.rb", "test/test_test-gem-one.rb"]
  s.homepage = %q{http://github.com/gabrielg/test-gem-one}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{TODO: one-line summary of your gem}
  s.test_files = ["test/helper.rb", "test/test_test-gem-one.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<test-gem-three>, [">= 0"])
    else
      s.add_dependency(%q<test-gem-three>, [">= 0"])
    end
  else
    s.add_dependency(%q<test-gem-three>, [">= 0"])
  end
end
