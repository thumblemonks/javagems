require 'rubygems/command'
require 'bundler'
require 'javagems/classpath_builder'
require 'stringio'

class Gem::StreamUI
  def print(str) @outs.print(str); end
end

Gem::UserInteraction.class_eval do
  def print(str) ui.print(str); end
end

class Gem::Commands::ClasspathCommand < Gem::Command
  attr_reader :cp_builder

  def initialize
    super 'classpath', "Given a Gemfile, returns the classpath necessary to satisfy dependencies"
    @cp_builder = JavaGems::ClasspathBuilder.new
  end

  def usage
    "#{program_name} [GEMFILE]"
  end

  def execute
    print(@cp_builder.classpath_for(options[:args].first))
  rescue => e
    alert_error(e.message)
    exit 1
  end

end 

