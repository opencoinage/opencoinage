require File.join(File.dirname(__FILE__), 'spec_helper')

describe "org.opencoinage.xmlrpc" do
  Client = org.opencoinage.xmlrpc.Client

  context "Client(URL)" do
    it "accepts one argument" do
      lambda { Client.new(java.net.URL.new('http://example.org/xmlrpc')) }.should_not raise_error
    end
  end

  context "Client(String)" do
    it "accepts one argument" do
      lambda { Client.new('http://example.org/xmlrpc') }.should_not raise_error
    end

    it "throws MalformedURLException if url specifies an unknown protocol" do
      lambda { Client.new('xttp://example.org/xmlrpc') }.should raise_error(java.net.MalformedURLException)
    end
  end

  context "Client#url" do
    before :each do
      @url = java.net.URL.new('http://example.org/xmlrpc')
      @client = Client.new(@url)
    end

    it "returns a URL" do
      @client.url.should be_a(java.net.URL)
      @client.url.should == @url
    end

    it "is immutable" do
      lambda { @client.url = @url }.should raise_error # FIXME
    end
  end

  context "Client#version" do
    it "returns a string" do
      # TODO
    end
  end

  context "Client#verify(Token)" do
    it "returns a boolean" do
      # TODO
    end
  end

  context "Client#describe(Token)" do
    it "returns a Map" do
      # TODO
    end
  end

  context "Client#reissue(Token)" do
    it "returns a new Token" do
      # TODO
    end
  end

  context "Client#reissue(Token, BigInteger)" do
    it "returns a new Token" do
      # TODO
    end
  end
end
