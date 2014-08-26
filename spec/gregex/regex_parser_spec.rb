require 'spec_helper'

describe Gregex::RegexParser do
  let(:gregex) { Gregex.new }

  describe "#original_options" do
    describe "checks if option i is given" do
      it "with i in original regex and as option given" do
        a = gregex.regex(/a/i, "i")
        expect(a).to match("A")
      end

      it "with i only given as option" do
        a = gregex.regex(/a/, "i")
        expect(a).to match("A")
      end

      it "with i only given as regex option" do
        a = gregex.regex(/a/i)
        expect(a).to match("A")
      end

      it "with i only given as option" do
        a = gregex.regex(/a/, "i")
        expect(a).to match("A")
      end
    end
  end
end
