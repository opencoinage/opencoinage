module OpenCoinage
  ##
  # A digital currency token.
  class Token
    ##
    # Initializes a new token.
    #
    # @param  [Integer, #to_i] identifier
    #   a unique token identifier
    def initialize(identifier)
      @identifier = identifier.to_i
    end

    ##
    # A token-specific unique identifier of arbitrary length.
    #
    # @return [Integer]
    attr_reader  :identifier
    alias_method :id, :identifier

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
    # @return [String] the token `identifier` encoded as a Base62 string
    def to_s
      Base62.encode(to_i)
    end

    ##
    # Returns the hash table representation of this token.
    #
    # @return [Hash]
    def to_hash
      {:identifier => identifier}
    end

    ##
    # Returns the JSON representation of this token.
    #
    # @return [String]
    def to_json
      require 'json' unless defined?(::JSON)
      to_hash.to_json
    end
  end # Token
end # OpenCoinage
