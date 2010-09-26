require File.join(File.dirname(__FILE__), 'spec_helper')

describe "org.opencoinage" do
  Issuer = org.opencoinage.Issuer

  context "Issuer.RDF_TYPE" do
    rdf_type = OpenCoinage::Issuer::RDF_TYPE.to_s

    it "returns <#{rdf_type}>" do
      Issuer::RDF_TYPE.should == rdf_type
    end
  end

  context "Issuer(URI)" do
    it "accepts one argument" do
      # TODO
    end
  end

  context "Issuer(URI, Map)" do
    it "accepts two arguments" do
      # TODO
    end

    it "permits options to be null" do
      # TODO
    end
  end

  context "Issuer(String)" do
    it "accepts one argument" do
      # TODO
    end

    it "throws URISyntaxException if uri is not a valid URI" do
      # TODO
    end
  end

  context "Issuer(String, Map)" do
    it "accepts two arguments" do
      # TODO
    end

    it "throws URISyntaxException if uri is not a valid URI" do
      # TODO
    end
  end

  context "Issuer#uri" do
    it "returns a URI" do
      # TODO
    end

    it "is immutable" do
      # TODO
    end
  end
end
