require 'bigdecimal'
require 'digest'
require 'stringio'
require 'bitcache'   # @see http://rubygems.org/gems/bitcache
require 'rdf'        # @see http://rubygems.org/gems/rdf
require 'uuid'       # @see http://rubygems.org/gems/uuid

module OpenCoinage
  autoload :Currency,   'opencoinage/currency'
  autoload :Token,      'opencoinage/token'
  autoload :Vocabulary, 'opencoinage/vocabulary'
  autoload :VERSION,    'opencoinage/version'

  Base62 = Bitcache::Encoder::Base62
end
