require 'spec_helper'

describe Gregex do
  plain_vowels = %w(α ε ι η ο υ ω)
    vowels_with_acute = %w(ά έ ή ί ó ύ ώ)
    vowels_with_grave = %w(ὰ ὲ ὴ ì ò ὺ ὼ)
    vowels_with_circumflex = %w(ᾶ ῆ ῖ ῦ ῶ)
  vowels = %w(α ε ι η ο υ ω
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
              ᾀ ᾁ ᾂ ᾃ ᾄ ᾅ ᾆ ᾇ ᾐ ᾑ ᾒ ᾓ ᾔ ᾕ ᾖ ᾗ ᾠ ᾡ ᾢ ᾣ ᾤ ᾥ ᾦ ᾧ)

  consonants = %w(β γ δ ζ θ κ λ μ ν ξ π ρ ῥ ῤ σ ς τ φ χ ψ)
  all_downcase_letters = vowels + consonants

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
    context "with \/\\w\/" do
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

    context "with \/\\w+\/" do
      describe "matches one or more greek chars" do
        it "like κλμ" do
          regex = Gregex.new(/\w+/)
          expect(regex).to match("κλμ")
        end

        it "like κ" do
          regex = Gregex.new(/\w+/)
          expect(regex).to match("κ")
        end
      end
    end

    context "with \/\\w{2}\/" do
      describe "matches exact 2 greek chars" do
        it "like κλμ" do
          regex = Gregex.new(/\w{2}/)
          expect(regex).to match("κλμ")
          expect(regex).not_to match("κ λ μ")
        end
      end
    end

    context "with \/\\S\/" do
      describe "matches any non white-space-char" do
        it "like κλμ" do
          regex = Gregex.new(/\S/)
          expect(regex).to match("κλμ")
        end

        it "like ." do
          regex = Gregex.new(/\S/)
          expect(regex).to match(".")
        end
      end
    end

    context "with \/[]\/" do
      describe "matches group of chars" do
        describe "like [α-ω]" do
          regex = Gregex.new(/[α-ω]/)
          plain_vowels.each do |vow|
            it "matches #{vow}" do
              expect(regex).to match(vow)
            end
          end
        end

        describe "like [β-ψ]" do
          regex = Gregex.new(/[β-ψ]/)
          consonants.each do |con|
            it "matches #{con}" do
              expect(regex).to match(con)
            end
          end
        end

        describe "like [ά-ώ]" do
          regex = Gregex.new(/[ά-ώ]/)
          vowels_with_acute.each do |vow|
            it "matches #{vow}" do
              expect(regex).to match(vow)
            end
          end
        end

        describe "like [ὰ-ὼ]" do
          regex = Gregex.new(/[ὰ-ὼ]/)
          vowels_with_grave.each do |vow|
            it "matches #{vow}" do
              expect(regex).to match(vow)
            end
          end
        end

        describe "like [ᾶ-ῶ]" do
          regex = Gregex.new(/[ᾶ-ῶ]/)
          vowels_with_circumflex.each do |vow|
            it "matches #{vow}" do
              expect(regex).to match(vow)
            end
          end
        end
      end
    end
  end
end
