module OpenCoinage; module XMLRPC
  ##
  # An OpenCoinage XML-RPC API client.
  #
  # @see http://opencoinage.org/api/xmlrpc
  class Client
    ##
    # Initializes the XML-RPC client.
    #
    # @param  [String, #to_s] url
    #   a valid URL specifying the XML-RPC endpoint
    # @param  [Hash{Symbol => Object}] options
    def initialize(url, options = {})
      @url, @options = RDF::URI(url), options.dup
    end

    ##
    # The URL for the XML-RPC endpoint.
    #
    # @return [RDF::URI]
    attr_reader :url

    ##
    # Returns the server's version number.
    #
    # @return [String] an "x.y.z" version number string
    def version
      raise NotImplementedError, "#{self.class}#version"
    end

    ##
    # Returns `true` if the given `token` is valid, `false` otherwise.
    #
    # @param  [Token]
    #   the token to verify
    # @return [Boolean] `true` or `false`
    def verify(token)
      raise NotImplementedError, "#{self.class}#verify"
    end

    ##
    # Returns information about the given `token`.
    #
    # @param  [Token] token
    #   the token to describe
    # @return [Hash] a key-value mapping describing the token
    def describe(token)
      raise NotImplementedError, "#{self.class}#describe"
    end

    ##
    # Issues a new token equivalent to the given `token`.
    #
    # @param  [Token] token
    #   the valid token to reissue
    # @param  [Integer] identifier
    #   a unique identifier for the new token
    # @return [Token] a new token
    def reissue(token, identifier = nil)
      raise NotImplementedError, "#{self.class}#reissue"
    end
  end # Client
end; end # OpenCoinage::XMLRPC
