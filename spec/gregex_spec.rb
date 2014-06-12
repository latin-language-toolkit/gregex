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

   all_capital_letters = %w(
        Α Ε Η Ι Ο Υ Ω
        Ἀ Ἁ Ἂ Ἃ Ἄ Ἅ Ἆ Ἇ ᾈ ᾉ ᾊ ᾋ ᾌ ᾍ ᾎ ᾏ
        Ἐ Ἑ Ἒ Ἓ Ἔ Ἕ
        Ἠ Ἡ Ἢ Ἣ Ἤ Ἥ Ἦ Ἧ ᾘ ᾙ ᾚ ᾛ ᾜ ᾝ ᾞ ᾟ
        Ἰ Ἱ Ἲ Ἳ Ἴ Ἵ Ἶ Ἷ
        Ὀ Ὁ Ὂ Ὃ Ὄ Ὅ
        Ὑ Ὓ Ὕ Ὗ
        Ὠ Ὡ Ὢ Ὣ Ὤ Ὥ Ὦ Ὧ ᾨ ᾩ ᾪ ᾫ ᾬ ᾭ ᾮ ᾯ)

  it 'should have a version number' do
    Gregex::VERSION.should_not be_nil
  end

  describe ".new" do
    context "with \\w" do
      regex = Gregex.new(/\w/)
      all_downcase_letters.each do |letter|
        it "matches #{letter}" do
          expect(regex).to match(letter)
        end
      end

      all_capital_letters.each do |letter|
        it "matches #{letter}" do
          expect(regex).to match(letter)
        end
      end
    end
  end
end
