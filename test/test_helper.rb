require 'rubygems'
require 'riot'
require 'pathname'
require 'stringio'

TestRoot = Pathname(__FILE__).parent

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
