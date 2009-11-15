require 'rubygems'
require 'rubygems/gem_runner'
require 'rubygems/exceptions'
require 'bundler'

module Gem
  DefaultGemConfigName = ".javagemrc"

  def self.config_file
    File.join Gem.user_home, DefaultGemConfigName
  end

  ConfigFile::PLATFORM_DEFAULTS.merge!(
    "install" => "--no-env-shebang --no-wrappers",
    "update"  => "--no-env-shebang --no-wrappers",
    :sources  => %w[http://gems.javagems.org/],
    :gemhome  => File.join(Gem.user_home, ".javagem/java"),
    :gempath  => [File.join(Gem.user_home, ".javagem/java")]
  )

end

class Gem::AbstractCommand < Gem::Command
  remove_const :URL
  URL = "http://javagems.org"
  
  # FIXME - remove the check for this constant if my patches get 
  # pulled into the gemcutter gem.
  if defined?(DESTINATION_NAME)
    remove_const :DESTINATION_NAME
    DESTINATION_NAME = "JavaGems"
  end

end

class Bundler::Environment

private

  def default_sources
    [Bundler::GemSource.new(:uri => "http://gems.javagems.org"), Bundler::SystemGemSource.instance]
  end

end
