module OpenCoinage
  ##
  # The reference implementation of the OpenCoinage XML-RPC API.
  #
  # @see http://opencoinage.org/api/xmlrpc
  module XMLRPC
    autoload :Client, 'opencoinage/xmlrpc/client'
    autoload :Server, 'opencoinage/xmlrpc/server'
  end # XMLRPC
end # OpenCoinage
