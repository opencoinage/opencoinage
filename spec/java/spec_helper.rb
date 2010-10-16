require 'opencoinage'
include OpenCoinage

require 'java' # @see http://jruby.org/
begin
  require File.join(File.dirname(__FILE__), '..', '..', 'pkg', 'java', "opencoinage-#{OpenCoinage::VERSION}.jar")
rescue LoadError => e
  warn e
end
