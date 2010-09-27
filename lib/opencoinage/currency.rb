module OpenCoinage
  ##
  # A digital currency contract.
  class Currency
    RDF_TYPE = Vocabulary[:Currency]

    ##
    # Initializes the currency.
    #
    # @param  [RDF::URI, String, #to_s] uri
    #   a valid URI identifying the currency
    # @param  [Hash{Symbol => Object}]  options
    # @option options [String] :name   (nil)
    #   the name of the currency
    # @option options [Issuer] :issuer (nil)
    #   the issuer of the currency
    def initialize(uri = nil, options = {})
      @uri    = RDF::URI(uri || UUID.generate(:urn))
      @name   = options[:name]   if options.has_key?(:name)
      @issuer = options[:issuer] if options.has_key?(:issuer)
    end

    ##
    # The URI identifying this currency.
    #
    # @return [RDF::URI]
    attr_reader :uri
    alias_method :to_uri, :uri

    ##
    # The name of this currency.
    #
    # @return [String]
    # @see    http://xmlns.com/foaf/spec/#term_name
    attr_accessor :name

    ##
    # The issuer of this currency.
    #
    # @return [Issuer]
    # @see    http://opencoinage.org/rdf/issuer
    attr_accessor :issuer

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
        graph << [uri, RDF::FOAF.name, name] if name
        graph << [uri, Vocabulary[:issuer], issuer.to_uri] if issuer
      end
    end
  end # Currency
end # OpenCoinage
