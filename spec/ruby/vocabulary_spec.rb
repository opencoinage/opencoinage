require File.join(File.dirname(__FILE__), 'spec_helper')

describe 'OpenCoinage::Vocabulary' do
  context "Vocabulary.issuer" do
    it "returns <http://opencoinage.org/rdf/issuer>" do
      OpenCoinage::Vocabulary.issuer.should == RDF::URI('http://opencoinage.org/rdf/issuer')
    end
  end
end
