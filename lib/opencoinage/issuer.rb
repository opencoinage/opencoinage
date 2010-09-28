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
    # @option options [String] :name (nil)
    #   the name of the issuer
    def initialize(uri = nil, options = {})
      @uri  = RDF::URI(uri || UUID.generate(:urn))
      @name = options[:name] if options.has_key?(:name)
    end

    ##
    # The URI identifying this issuer.
    #
    # @return [RDF::URI]
    attr_reader :uri
    alias_method :to_uri, :uri

    ##
    # The name of this issuer.
    #
    # @return [String]
    # @see    http://xmlns.com/foaf/spec/#term_name
    attr_accessor :name

    ##
    # Returns the hash table representation of this issuer.
    #
    # @return [Hash]
    def to_hash
      {:name => name}
    end

    ##
    # Returns the JSON representation of this issuer.
    #
    # @return [String]
    # @see    http://en.wikipedia.org/wiki/JSON
    # @see    http://json.rubyforge.org/
    def to_json
      require 'json' unless defined?(::JSON)
      to_hash.to_json
    end

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
        graph << [uri, RDF::FOAF.name, name] if name
      end
    end
  end # Issuer
end # OpenCoinage
