require 'xmlrpc/server'

begin
  require 'builder/xchar' # @see http://rubygems.org/gems/builder
rescue LoadError
  abort "OpenCoinage XML-RPC requires the Builder gem (hint: `gem install builder')."
end

module OpenCoinage; module XMLRPC
  ##
  # An OpenCoinage XML-RPC server implementation.
  #
  # @see http://opencoinage.org/api/xmlrpc
  # @see http://ruby-doc.org/stdlib/libdoc/xmlrpc/rdoc/classes/XMLRPC/BasicServer.html
  class Server < ::XMLRPC::BasicServer
    ##
    # Initializes the XML-RPC server.
    #
    # @param  [Hash{Symbol => Object}] options
    # @option options [Boolean] :multicall     (true)
    # @option options [Boolean] :introspection (true)
    # @option options [Boolean] :capabilities  (true)
    def initialize(options = {})
      @options = options.dup
      super()
      add_multicall     unless @options[:multicall]     == false
      add_introspection unless @options[:introspection] == false
      add_capabilities  unless @options[:capabilities]  == false
      add_handler('opencoinage.version',  %w(string),         '', &method(:version))
      add_handler('opencoinage.verify',   %w(boolean string), '', &method(:verify))
      add_handler('opencoinage.describe', %w(struct string),  '', &method(:describe))
      add_handler('opencoinage.reissue',  %w(string string),  '', &method(:reissue))
    end

    ##
    # Returns the server's version number.
    #
    # @return [String] an "x.y.z" version number string
    # @see    http://opencoinage.org/api/xmlrpc#version
    def version
      OpenCoinage::VERSION.to_s
    end

    ##
    # Returns `true` if the given `token` is valid, `false` otherwise.
    #
    # @param  [String]
    #   the token to verify (encoded as a Base62 string)
    # @return [Boolean] `true` or `false`
    # @see    http://opencoinage.org/api/xmlrpc#verify
    def verify(token)
      raise NotImplementedError, "#{self.class}#verify"
    end

    ##
    # Returns information about the given `token`.
    #
    # @param  [String] token
    #   the token to describe (encoded as a Base62 string)
    # @return [Hash] a key-value mapping describing the token
    # @see    http://opencoinage.org/api/xmlrpc#describe
    def describe(token)
      raise NotImplementedError, "#{self.class}#describe"
    end

    ##
    # Issues a new token equivalent to the given `token`.
    #
    # @param  [String] token
    #   the valid token to reissue (encoded as a Base62 string)
    # @param  [String] identifier
    #   a unique identifier for the new token (encoded as a Base62 string)
    # @return [String] a new token (encoded as a Base62 string)
    # @see    http://opencoinage.org/api/xmlrpc#reissue
    def reissue(token, identifier = nil)
      raise NotImplementedError, "#{self.class}#reissue"
    end

  protected

    ##
    # Implements the `system.getCapabilities` standard method, enabling
    # clients to determine whether a given capability is supported by this
    # server.
    #
    # @param  [Hash{Symbol => Object}] options
    # @option options [Boolean] :faults_interop (true)
    #   whether to indicate support for the XMLRPC-EPI Specification for
    #   Fault Code Interoperability
    # @return [void]
    # @see    http://xmlrpc-epi.sourceforge.net/specs/rfc.fault_codes.php
    def add_capabilities(options = {})
      add_handler('system.getCapabilities', %w(struct), '') do
        capabilities = {}
        unless options[:faults_interop] == false
          capabilities['faults_interop'] = {
            'specUrl'     => 'http://xmlrpc-epi.sourceforge.net/specs/rfc.fault_codes.php',
            'specVersion' => 20010516,
          }
        end
        capabilities
      end
      self
    end
  end # Server
end; end # OpenCoinage::XMLRPC
