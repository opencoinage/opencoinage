require 'bigdecimal'
require 'digest'
require 'stringio'
require 'bitcache'   # @see http://rubygems.org/gems/bitcache
require 'rdf'        # @see http://rubygems.org/gems/rdf
require 'uuid'       # @see http://rubygems.org/gems/uuid

module OpenCoinage
  autoload :Issuer,     'opencoinage/issuer'
  autoload :Currency,   'opencoinage/currency'
  autoload :Token,      'opencoinage/token'
  autoload :Vocabulary, 'opencoinage/vocabulary'
  autoload :Util,       'opencoinage/util'
  autoload :XMLRPC,     'opencoinage/xmlrpc'
  autoload :VERSION,    'opencoinage/version'
end
