require 'spec_helper'

describe Gregex do
  all_downcase_letters = %w(α ε ι η ο υ ω
        β γ δ ζ θ κ λ μ ν ξ π ρ ῥ ῤ σ ς τ φ χ ψ
        ά έ ή ί ó ύ ώ
        ὰ ὲ ὴ ì ò ὺ ὼ
        ᾶ ῆ ῖ ῦ ῶ
        ἂ ἒ ἲ ἢ ὂ ὒ ὢ
        ᾲ ᾳ ᾴ ᾷ ῂ ῃ ῄ ῇ ῲ ῳ ῴ ῷ
        ἀ ἐ ἠ ἰ ὀ ὐ ὠ
        ἄ ἔ ἴ ἤ ὄ ὔ ὤ
        ἆ ἶ ἦ ὖ ὦ
        ἁ ἑ ἡ ἱ ὁ ὑ ὡ
        ἇ ἷ ἧ ὗ ὧ
        ἃ ἣ ἓ ἳ ὃ ὓ ὣ
        ἅ ἥ ἕ ἵ ὅ ὕ ὥ
        ᾀ ᾁ ᾂ ᾃ ᾄ ᾅ ᾆ ᾇ ᾐ ᾑ ᾒ ᾓ ᾔ ᾕ ᾖ ᾗ ᾠ ᾡ ᾢ ᾣ ᾤ ᾥ ᾦ ᾧ )

  it 'should have a version number' do
    Gregex::VERSION.should_not be_nil
  end

  describe ".new" do
    context "with \w" do
      regex = Gregex.new(/\w/)
      all_downcase_letters.each do |letter|
        it "matches #{letter}" do
          expect(regex).to match(letter)
        end
      end
    end
  end
end
