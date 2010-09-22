module OpenCoinage
  ##
  # A digital currency token.
  class Token
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
    def to_json
      require 'json' unless defined?(::JSON)
      to_hash.to_json
    end
  end # Token
end # OpenCoinage
