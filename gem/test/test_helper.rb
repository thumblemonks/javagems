require 'rubygems'
require 'riot'
require 'pathname'
require 'stringio'

TestRoot = Pathname(__FILE__).parent

module Kernel

  def capture_std_stream(stream_name)
    original_stream = Object.const_get(stream_name.to_s.upcase)
    fake_stream = StringIO.new
    Object.const_set(stream_name.to_s.upcase, fake_stream)
    yield
    fake_stream.rewind
    fake_stream.read
  ensure
    Object.const_set(stream_name.to_s.upcase, original_stream)
  end

end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
