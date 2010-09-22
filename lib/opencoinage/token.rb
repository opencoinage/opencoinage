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
  end # Token
end # OpenCoinage
