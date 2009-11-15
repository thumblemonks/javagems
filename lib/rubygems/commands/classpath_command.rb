require 'rubygems/command'
require 'bundler'
require 'stringio'

class Gem::Commands::ClasspathCommand < Gem::Command

  def initialize
    super 'classpath', "Given a Gemfile, returns the classpath necessary to satisfy dependencies"
  end

  def usage
    "#{program_name} [GEMFILE]"
  end

  def execute
    with_hijacked_bundler_logging do
      bundler_env = Bundler::Environment.load(options[:args].first)
      deps = bundler_env.dependencies.map {|dep| dep.to_gem_dependency }

      cp = Bundler::Resolver.resolve(deps, sources).collect do |spec|
        (Pathname(spec.full_gem_path) + "lib").expand_path.to_s
      end.join(File::PATH_SEPARATOR)
      say(cp)
    end
  rescue => e
    alert_error(e.message)
    @hijacked_out.readlines.each { |l| alert_error(l.strip) }
    exit 1
  end

private
  
  def with_hijacked_bundler_logging
    @hijacked_out = StringIO.new
    real_logger, Bundler.logger = Bundler.logger, Logger.new(@hijacked_out, Logger::INFO)
    Bundler.logger.formatter = real_logger.formatter
    yield
  ensure
    @hijacked_out.rewind
    Bundler.logger = real_logger
  end

  # FIXME - Until we have actual bundler support, use the system source index.
  def sources
    [Bundler::SystemGemSource.instance]
  end

end 

