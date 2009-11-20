require 'bundler'

module JavaGems
  class ClasspathBuilder
    class ClasspathError < RuntimeError; end
    
    def classpath_for(gemfile)
      with_hijacked_bundler_logging do
        bundler_env = Bundler::Environment.load(gemfile)
        deps = bundler_env.dependencies.map {|dep| dep.to_gem_dependency }
        cp = Bundler::Resolver.resolve(deps, sources).collect do |spec|
          spec.require_paths.collect do |req_path|
            (Pathname(spec.full_gem_path) + req_path).expand_path.to_s
          end
        end.flatten.join(File::PATH_SEPARATOR)
      end

    rescue => e
      raise ClasspathError, "#{e.message} - #{@hijacked_out.read}"  
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

    # I will find gems in a relative vendor directory and then using the system source, similar to how
    # Gem Bundler will normally work
    def sources
      [Bundler::DirectorySource.new(:location => 'vendor'), Bundler::SystemGemSource.instance]
    end

  end # ClasspathBuilder
end   # JavaGems
