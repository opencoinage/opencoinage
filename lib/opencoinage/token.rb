module OpenCoinage
  ##
  # A digital currency token.
  class Token
    ##
    # Initializes a new token.
    #
    # @param  [Integer, #to_i] id
    #   a unique identifier
    def initialize(id)
      @id = id.to_i
    end

    ##
    # A token-specific unique identifier of arbitrary length.
    #
    # @return [Integer]
    attr_reader :id

    ##
    # Returns the integer representation of this token.
    #
    # @return [Integer] the token `id`
    def to_i
      id
    end

    ##
    # Returns the string representation of this token.
    #
    # @return [String] the token `id` encoded as a Base62 string
    def to_s
      Bitcache::Encoder::Base62.encode(to_i)
    end

    ##
    # Returns the hash table representation of this token.
    #
    # @return [Hash]
    def to_hash
      {:id => id}
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
