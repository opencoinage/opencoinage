module OpenCoinage
  ##
  # A digital currency issuer.
  class Issuer
    RDF_TYPE = Vocabulary[:Issuer]

    ##
    # Initializes the issuer.
    #
    # @param  [RDF::URI, String, #to_s] uri
    #   a valid URI identifying the issuer
    # @param  [Hash{Symbol => Object}]  options
    def initialize(uri = nil, options = {})
      @uri = RDF::URI(uri || UUID.generate(:urn))
    end

    ##
    # The URI identifying this issuer.
    #
    # @return [RDF::URI]
    attr_reader  :uri
    alias_method :to_uri, :uri

    ##
    # Returns the RDF representation of this issuer.
    #
    # @param  [Hash{Symbol => Object}] options
    # @option options [RDF::Resource]  :context (nil)
    # @return [RDF::Graph]
    # @see    http://en.wikipedia.org/wiki/Resource_Description_Framework
    # @see    http://rdf.rubyforge.org/RDF/Graph.html
    def to_rdf(options = {})
      RDF::Graph.new(options[:context]) do |graph|
        graph << [uri, RDF.type, self.class.const_get(:RDF_TYPE)]
      end
    end
  end # Issuer
end # OpenCoinage
