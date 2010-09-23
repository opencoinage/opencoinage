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

    ##
    # Returns the RDF representation of this currency.
    #
    # @param  [Hash{Symbol => Object}] options
    # @option options [RDF::Resource]  :context (nil)
    # @return [RDF::Graph]
    # @see    http://en.wikipedia.org/wiki/Resource_Description_Framework
    # @see    http://rdf.rubyforge.org/RDF/Graph.html
    def to_rdf(options = {})
      RDF::Graph.new(options[:context]) do |graph|
        graph << [uri, RDF.type, self.class.const_get(:RDF_TYPE)]
        graph << [uri, Vocabulary[:issuer], issuer.to_uri] if issuer
      end
    end
  end # Currency
end # OpenCoinage
