require File.join(File.dirname(__FILE__), 'spec_helper')

describe "org.opencoinage.util" do
  Base62 = org.opencoinage.util.Base62

  context "Base62.encode(BigInteger)" do
    it "accepts one argument" do
      lambda { Base62.encode(0) }.should_not raise_error
    end

    it "returns a String" do
      Base62.encode(0).should be_a(String)
    end

    it "throws IllegalArgumentException if number is negative" do
      lambda { Base62.encode(-1) }.should raise_error(java.lang.IllegalArgumentException)
    end
  end

  context "Base62.decode(String)" do
    it "accepts one argument" do
      lambda { Base62.decode('0') }.should_not raise_error
    end

    it "returns a BigInteger" do
      Base62.decode('0').should be_a(Integer)
    end

    it "throws IllegalArgumentException if string is empty" do
      lambda { Base62.decode('') }.should raise_error(java.lang.IllegalArgumentException)
    end
  end

  examples = {0 => '0', 1_000 => 'G8', 1_000_000 => '4C92', 1_000_000_000 => '15ftgG'}

  examples.each do |number, string|
    context "Base62.encode(#{number})" do
      it "returns '#{string}'" do
        Base62.encode(number).should == string
      end
    end
  end

  examples.each do |number, string|
    context "Base62.decode('#{string}')" do
      it "returns #{number}" do
        Base62.decode(string).should == number
      end
    end
  end
end
