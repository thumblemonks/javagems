require 'test_helper'

# We fork here so we don't mess up the current Gem environment
# in the process of running our tests, because that's what
# the gem_overrides do.
pid = fork do
require 'javagems/gem_overrides'
require 'pathname'

context "the given gem overrides" do
  
  setup do
    # FIXME - we unset the @configuration variable so
    # RubyGems re-reads its configuration. It's kind
    # of a seedy hack.
    Gem.instance_variable_set('@configuration', nil)
  end

  should "change the config file name to be named .javagemrc" do
    File.basename Gem.configuration.config_file_name
  end.equals(".javagemrc")

  should "place the config file in the gem user_home" do
    File.dirname Gem.configuration.config_file_name
  end.equals(Gem.user_home)
  
  should "set the gemhome to be at .javagem/java in the gem user_home" do
    Pathname(Gem.configuration.home).relative_path_from(Pathname(Gem.user_home)).to_s
  end.equals(".javagem/java")
  
  should "only have one entry in the gem path" do
    Gem.configuration.path.size
  end.equals(1)

  should "set the gempath to be at .javagem/java in the gem user_home" do
    Pathname(Gem.configuration.path.first).relative_path_from(Pathname(Gem.user_home)).to_s
  end.equals(".javagem/java")

  should "only have one entry in the default sources" do
    Gem.sources.size
  end.equals(1)

  should "set the default sources to be gems.javagems.org" do
    Gem.sources.first
  end.equals("http://gems.javagems.org/")

  should "default to using no-env-shebang on install" do
    Gem.configuration["install"]
  end.matches("--no-env-shebang")

  should "default to using no-wrappers on install" do
    Gem.configuration["install"]
  end.matches("--no-wrappers")

  should "default to using no-env-shebang on update" do
    Gem.configuration["update"]
  end.matches("--no-env-shebang")

  should "default to using no-wrappers on update" do
    Gem.configuration["update"]
  end.matches("--no-wrappers")
  
  should "override the url gemcutter sets to be javagems.org" do
    Gem::AbstractCommand::URL
  end.equals("http://javagems.org")

end
end
Process.waitpid(pid)
