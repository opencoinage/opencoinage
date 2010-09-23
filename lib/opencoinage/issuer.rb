module OpenCoinage
  ##
  # A digital currency issuer.
  class Issuer
    RDF_TYPE = Vocabulary[:Issuer]

    ##
    # Initializes the issuer.
    #
    # @param  [RDF::URI, String, #to_s] uri
    # @param  [Hash{Symbol => Object}]  options
    def initialize(uri = nil, options = {})
      @uri = RDF::URI(uri || UUID.generate(:urn))
    end

    ##
    # The URI of this issuer.
    #
    # @return [RDF::URI]
    attr_reader  :uri
    alias_method :to_uri, :uri
  end # Issuer
end # OpenCoinage
