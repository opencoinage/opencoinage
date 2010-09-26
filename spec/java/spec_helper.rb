require 'opencoinage'
include OpenCoinage

require 'java' # @see http://jruby.org/
require File.join(File.dirname(__FILE__), '..', '..', 'pkg', 'java', "opencoinage-#{OpenCoinage::VERSION}.jar")
