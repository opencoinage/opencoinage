module OpenCoinage
  ##
  # A digital currency contract.
  class Currency
    ##
    # Initializes the currency.
    #
    # @param  [Hash{Symbol => Object}] options
    # @option options [Issuer] :issuer (nil)
    def initialize(options = {})
      @issuer = options[:issuer]
    end

    ##
    # The issuer of this currency.
    #
    # @return [Issuer]
    attr_reader :issuer
  end # Currency
end # OpenCoinage
