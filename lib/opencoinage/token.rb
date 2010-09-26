module OpenCoinage
  ##
  # A digital currency token.
  class Token
    RDF_TYPE = Vocabulary[:Token]

    ##
    # Parses and returns the given Base62-encoded token.
    #
    # @example
    #   Token.parse("deadbeef")   #=> Token.new(139648545098945, nil)
    #   Token.parse("deadbeef:")  #=> Token.new(139648545098945, nil)
    #   Token.parse("dead:beef")  #=> Token.new(9450823, 8974417)
    #
    # @param  [String, #to_str] input
    #   a Base62-based string representation of the token
    # @return [Token] the parsed token
    # @raise  [ArgumentError] if `input` is not a Base62 string
    def self.parse(input)
      identifier, signature = (input = Bitcache.read(input).strip).split(':', 2)
      signature = nil if signature && signature.empty?
      if Base62.regexp === identifier && (signature.nil? || Base62.regexp === signature)
        self.new(Base62.decode(identifier), signature ? Base62.decode(signature) : nil)
      else
        raise ArgumentError, "expected a Base62-encoded token, but got #{input.inspect}"
      end
    end

    ##
    # Initializes a new token.
    #
    # @param  [Integer, #to_i] identifier
    #   a unique token identifier of arbitrary length
    # @param  [Integer, #to_i] signature
    #   the issuer's digital signature
    def initialize(identifier, signature = nil)
      @identifier = identifier.to_i
      @signature  = signature ? signature.to_i : nil
    end

    ##
    # The token's unique identifier.
    #
    # @return [Integer]
    attr_reader  :identifier
    alias_method :id, :identifier

    ##
    # The issuer's digital signature.
    #
    # @return [Integer]
    attr_reader :signature

    ##
    # Returns `true` if this token contains a digital signature, `false`
    # otherwise.
    #
    # @return [Boolean]
    #   `true` if the token is digitally signed, `false` otherwise
    def signed?
      !!signature
    end

    ##
    # Returns the integer representation of this token.
    #
    # @return [Integer] the token `identifier`
    def to_i
      identifier
    end

    ##
    # Returns the string representation of this token.
    #
    # @return [String] a Base62 string
    def to_s
      to_a.compact.map { |n| Base62.encode(n) }.join(':') # FIXME
    end

    ##
    # Returns the array representation of this token.
    #
    # @example
    #   identifier, signature = token.to_a
    #
    # @return [Array]
    #   a two-element array containing the `identifier` and `signature`
    def to_a
      [identifier, signature]
    end

    ##
    # Returns the hash table representation of this token.
    #
    # @return [Hash]
    def to_hash
      {:identifier => identifier, :signature => signature}
    end

    ##
    # Returns the JSON representation of this token.
    #
    # @return [String]
    # @see    http://en.wikipedia.org/wiki/JSON
    # @see    http://json.rubyforge.org/
    def to_json
      require 'json' unless defined?(::JSON)
      to_hash.to_json
    end

    ##
    # Returns the RDF representation of this token.
    #
    # @param  [Hash{Symbol => Object}] options
    # @option options [RDF::Resource]  :context (nil)
    # @option options [RDF::Resource]  :subject (RDF::Node(object_id))
    # @return [RDF::Graph]
    # @see    http://en.wikipedia.org/wiki/Resource_Description_Framework
    # @see    http://rdf.rubyforge.org/RDF/Graph.html
    def to_rdf(options = {})
      RDF::Graph.new(options[:context]) do |graph|
        subject = options[:subject] || RDF::Node(object_id)
        graph << [subject, RDF.type,                self.class.const_get(:RDF_TYPE)]
        graph << [subject, Vocabulary[:identifier], identifier]
        graph << [subject, Vocabulary[:signature],  signature] if signed?
      end
    end
  end # Token
end # OpenCoinage
