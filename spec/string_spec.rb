require_relative '../string'

describe String do
  describe "#addition" do

    context "empty string" do
      it { "".addition.should == 0 }
    end

    context "string with one number only" do
      it "just gives you that number" do
        "1".addition.should == 1
      end
    end

    context "string with two comma-separated numbers" do
      it "is the sum of the two numbers" do
        "1,2".addition.should == 3
      end
    end

    context "string with any amount of comma-separated numbers" do
      it "is the sum of the numbers" do
        "1,2,3,4".addition.should == 1+2+3+4
      end
    end

    context "numbers in the string can be separated with new lines" do
      it "is the sum of the two numbers" do
        "1\n2,3".addition.should == 1+2+3
      end
    end

    context "support different custom delimiters" do
      # “//[delimiter]\n[numbers…]”
      it { "//;\n3;5".addition.should == 8 }
    end

    context "negative numbers" do
      it "throws a 'negatives not allowed' exception" do
        # Calling Add with a negative number will throw an exception "negatives not allowed" -
        # and the negative that was passed.
        # if there are multiple negatives, show all of them in the exception message
        expect { "1,-2".addition       }.to raise_error("negatives not allowed: -2")
        expect { "1,-2,-3,-4".addition }.to raise_error("negatives not allowed: -2,-3,-4")
      end
    end

    context "ignore numbers bigger than 1000" do
      it { "1,1000,1001".addition.should == 1001 }
    end

    context "support delimiters of any length" do
      # Delimiters can be of any length with the following format: “//[delimiter]\n”
      it { "//[***]\n1***2***3".addition.should == 6 }
    end
    
    context "support multiple delimiters" do
      # Allow multiple delimiters like this:  “//[delim1][delim2]\n”
      xit { "//[*][%]\n1*2%3".addition.should == 6 }
    end

  end

end
