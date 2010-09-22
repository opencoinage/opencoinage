require 'bigdecimal'
require 'digest'
require 'stringio'
require 'rdf'        # @see http://rubygems.org/gems/rdf
require 'uuid'       # @see http://rubygems.org/gems/uuid

module OpenCoinage
  autoload :Currency,   'opencoinage/currency'
  autoload :Token,      'opencoinage/token'
  autoload :Vocabulary, 'opencoinage/vocabulary'
  autoload :VERSION,    'opencoinage/version'
end
