require File.join(File.dirname(__FILE__), 'spec_helper')

describe "org.opencoinage" do
  Currency = org.opencoinage.Currency

  context "Currency.RDF_TYPE" do
    rdf_type = OpenCoinage::Currency::RDF_TYPE.to_s

    it "returns <#{rdf_type}>" do
      Currency::RDF_TYPE.should == rdf_type
    end
  end

  context "Currency(URI)" do
    it "accepts one argument" do
      # TODO
    end
  end

  context "Currency(URI, Map)" do
    it "accepts two arguments" do
      # TODO
    end

    it "permits options to be null" do
      # TODO
    end

    it "sets the #issuer field if options contains an :issuer key" do
      # TODO
    end
  end

  context "Currency(String)" do
    it "accepts one argument" do
      # TODO
    end

    it "throws URISyntaxException if uri is not a valid URI" do
      # TODO
    end
  end

  context "Currency(String, Map)" do
    it "accepts two arguments" do
      # TODO
    end

    it "throws URISyntaxException if uri is not a valid URI" do
      # TODO
    end
  end

  context "Currency#uri" do
    it "returns a URI" do
      # TODO
    end

    it "is immutable" do
      # TODO
    end
  end

  context "Currency#name" do
    it "returns a string" do
      # TODO
    end

    it "is mutable" do
      # TODO
    end
  end

  context "Currency#issuer" do
    it "returns an Issuer" do
      # TODO
    end

    it "is mutable" do
      # TODO
    end
  end
end
