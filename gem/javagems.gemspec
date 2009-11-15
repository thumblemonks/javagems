# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{javagems}
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["gabrielg", "jaknowlden"]
  s.date = %q{2009-11-14}
  s.description = %q{Provides gem-esque support to Java}
  s.email = %q{gabriel.gironda@gmail.com}
  s.executables = ["javagem", "javagem"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     ".gitignore",
     "LICENSE",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "Rakefile",
     "VERSION",
     "bin/javagem",
     "javagems.gemspec",
     "lib/javagems.rb",
     "lib/javagems/commands/javagem_command.rb",
     "lib/javagems/gem_overrides.rb",
     "lib/rubygems/commands/classpath_command.rb",
     "lib/rubygems/commands/jeweler_command.rb",
     "test/aaaaagem_overrides_test.rb",
     "test/classpath_command_test.rb",
     "test/jeweler_command_test.rb",
     "test/test_app/Gemfile",
     "test/test_app/vendor/gems/environment.rb",
     "test/test_app/vendor/gems/specifications/test-gem-four-0.0.0.gemspec",
     "test/test_app/vendor/gems/specifications/test-gem-one-0.0.0.gemspec",
     "test/test_app/vendor/gems/specifications/test-gem-three-0.0.0.gemspec",
     "test/test_app/vendor/gems/specifications/test-gem-two-0.0.0.gemspec",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://www.javagems.org/}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A gem for the javagems system}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<gemcutter>, [">= 0"])
      s.add_runtime_dependency(%q<jeweler>, [">= 0"])
      s.add_runtime_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<riot>, [">= 0"])
    else
      s.add_dependency(%q<gemcutter>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<riot>, [">= 0"])
    end
  else
    s.add_dependency(%q<gemcutter>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<riot>, [">= 0"])
  end
end

