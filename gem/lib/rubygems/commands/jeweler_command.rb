require 'rubygems/command'
require 'jeweler/generator'

class Gem::Commands::JewelerCommand < Gem::Command
  def initialize
    super 'jeweler', "Generates a shiny new gem for you using Jeweler"
  end

  def usage
    Jeweler::Generator::Options.new([]).opts.to_s
  end

  def execute
    Jeweler::Generator::Application.run!(*options[:args])
  end

end 
