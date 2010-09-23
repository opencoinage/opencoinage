module OpenCoinage
  ##
  # An RDFS vocabulary for digital currency issuance.
  #
  # @see http://opencoinage.org/rdf/
  # @see http://rdf.rubyforge.org/RDF/Vocabulary.html
  class Vocabulary < RDF::Vocabulary('http://opencoinage.org/rdf/')
    property :amount
    property :expires
    property :identifier
    property :issuer
    property :signature
  end # Vocabulary
end # OpenCoinage
