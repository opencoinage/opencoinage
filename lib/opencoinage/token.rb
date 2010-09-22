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
