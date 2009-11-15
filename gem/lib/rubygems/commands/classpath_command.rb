require 'rubygems/command'
require 'bundler'

class Gem::Commands::ClasspathCommand < Gem::Command
  Bundler.logger.level = Logger::FATAL

  def initialize
    super 'classpath', "Given a Gemfile, returns the classpath necessary to satisfy dependencies"
  end

  def usage
    "#{program_name} [GEMFILE]"
  end

  def execute
    bundler_env = Bundler::Environment.load(options[:args].first)
    deps = bundler_env.dependencies.map {|dep| dep.to_gem_dependency }

    cp = Bundler::Resolver.resolve(deps, sources).collect do |spec|
      (Pathname(spec.full_gem_path) + "lib").expand_path.to_s
    end.join(File::PATH_SEPARATOR)
    say(cp)
  end

private
  
  # FIXME - Until we have actual bundler support, use the system source index.
  def sources
    [Bundler::SystemGemSource.instance]
  end

end 

