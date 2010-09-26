require File.join(File.dirname(__FILE__), 'spec_helper')

describe "org.opencoinage.Token" do
  Token = org.opencoinage.Token

  context "Token.RDF_TYPE" do
    rdf_type = OpenCoinage::Token::RDF_TYPE.to_s

    it "returns <#{rdf_type}>" do
      Token::RDF_TYPE.should == rdf_type
    end
  end

  context "Token(BigInteger, BigInteger)" do
    it "accepts two arguments" do
      # TODO
    end
  end

  context "Token(BigInteger)" do
    it "accepts one argument" do
      # TODO
    end
  end

  context "Token(Map)" do
    it "accepts one argument" do
      # TODO
    end

    it "throws NullPointerException if options is null" do
      # TODO
    end

    it "throws IllegalArgumentException options does not contain an :identifier key" do
      # TODO
    end
  end

  context "Token#identifier" do
    it "returns a BigInteger" do
      # TODO
    end
  end

  context "Token#signature" do
    it "returns a BigInteger if the token is digitally signed" do
      # TODO
    end

    it "returns null if the token is not digitally signed" do
      # TODO
    end
  end

  context "Token#isSigned" do
    it "returns true if the token is digitally signed" do
      # TODO
    end

    it "returns false if the token is not digitally signed" do
      # TODO
    end
  end

  context "Token#toInteger" do
    it "returns a BigInteger" do
      # TODO
    end
  end

  context "Token#toString" do
    it "returns a string" do
      # TODO
    end
  end

  context "Token#toArray" do
    it "returns a two-element BigInteger[] array" do
      # TODO
    end
  end
end
