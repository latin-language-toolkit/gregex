require 'spec_helper'

describe Gregex::RegexParser do
  describe "#original_options" do
    describe "checks if option i is given" do
      it "with i in original regex and as option given" do
        a = Gregex.new(/a/i, "i")
        expect(a).to match("A")
      end

      it "with i only given as option" do
        a = Gregex.new(/a/, "i")
        expect(a).to match("A")
      end
    end
  end
end
