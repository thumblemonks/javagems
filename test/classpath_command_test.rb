require 'test_helper'
require 'rubygems/commands/classpath_command'
require 'pathname'

context "the classpath command" do

  context "given a valid Gemfile" do
    setup do
      @command = Gem::Commands::ClasspathCommand.new
      # FIXME - ghetto-mock
      cp_builder = @command.cp_builder
      def cp_builder.sources
        [Bundler::DirectorySource.new(:location => (TestRoot + "valid_test_app/vendor").expand_path.to_s)]
      end
    end

    should "return the expected classpath on stdout" do
      out = StringIO.new
      @command.ui = Gem::StreamUI.new(StringIO.new, out)
      @command.invoke((TestRoot + "valid_test_app/Gemfile").expand_path.to_s)
      out.rewind
      out.read.split(File::PATH_SEPARATOR).collect { |p| Pathname(p).parent.basename.to_s }
    end.equals(["test-gem-two", "test-gem-three", "test-gem-one", "test-gem-four"])

  end # given a valid Gemfile

  context "given a Gemfile with missing dependencies" do
    setup do
      @command = Gem::Commands::ClasspathCommand.new
      # FIXME - ghetto-mock
      cp_builder = @command.cp_builder
      def cp_builder.sources
        [Bundler::DirectorySource.new(:location => (TestRoot + "invalid_test_app/vendor").expand_path.to_s)]
      end

      def @command.exit(status)
        nil
      end
    end

    should "return an error on stderr" do
      err = StringIO.new
      @command.ui = Gem::StreamUI.new(StringIO.new, StringIO.new, err)
      @command.invoke((TestRoot + "invalid_test_app/Gemfile").expand_path.to_s)
      err.rewind
      err.read
    end.matches(/Could not find gem/)

  end # given a valid Gemfile

end



