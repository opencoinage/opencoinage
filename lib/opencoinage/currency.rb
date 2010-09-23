module OpenCoinage
  ##
  # A digital currency contract.
  class Currency
    RDF_TYPE = Vocabulary[:Currency]

    ##
    # Initializes the currency.
    #
    # @param  [RDF::URI, String, #to_s] uri
    # @param  [Hash{Symbol => Object}]  options
    # @option options [Issuer] :issuer (nil)
    def initialize(uri = nil, options = {})
      @uri    = RDF::URI(uri || UUID.generate(:urn))
      @issuer = options[:issuer]
    end

    ##
    # The URI of this currency.
    #
    # @return [RDF::URI]
    attr_reader  :uri
    alias_method :to_uri, :uri

    ##
    # The issuer of this currency.
    #
    # @return [Issuer]
    attr_reader :issuer
  end # Currency
end # OpenCoinage
