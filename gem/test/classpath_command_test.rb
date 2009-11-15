require 'test_helper'
require 'rubygems/commands/classpath_command'
require 'pathname'

context "the classpath command" do
  context "given a valid Gemfile" do
    setup do
      @command = Gem::Commands::ClasspathCommand.new
      # FIXME - ghetto-mock
      def @command.sources
        [Bundler::DirectorySource.new(:location => (TestRoot + "test_app/vendor").expand_path.to_s)]
      end
    end

    should "return the expected classpath on stdout" do
      capture_std_stream(:stdout) do
        @command.invoke((TestRoot + "test_app/Gemfile").expand_path.to_s)
      end.split(File::PATH_SEPARATOR).collect { |p| Pathname(p).parent.basename.to_s }
    end.equals(["test-gem-two", "test-gem-three", "test-gem-one", "test-gem-four"])

  end

end



