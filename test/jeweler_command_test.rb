require 'test_helper'
require 'rubygems/commands/jeweler_command'
require 'stringio'

context "the jeweler command" do
  setup do
    @command = Gem::Commands::JewelerCommand.new
  end

  should "return jeweler's usage information when asked for usage" do
    @command.usage
  end.equals(Jeweler::Generator::Options.new([]).opts.to_s)
  
  should "invoke jeweler when invoked" do
    begin
      real_stderr, $stderr = $stderr, StringIO.new
      @command.execute
    ensure
      $stderr = real_stderr
    end
  end.equals(1)

end

