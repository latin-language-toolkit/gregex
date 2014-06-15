module Gregex
  class RegexParser

    MAP = { '\w' => Gregex::Constants::ALL,
            '[α-ω]' => Gregex::Constants::PLAIN_VOWELS,
            '[ά-ώ]' => Gregex::Constants::VOWELS_WITH_ACUTE,
            '[ὰ-ὼ]' => Gregex::Constants::VOWELS_WITH_GRAVE,
            '[ᾶ-ῶ]' => Gregex::Constants::VOWELS_WITH_CIRCUMFLEX,
            '[β-ψ]' => Gregex::Constants::CONSONANTS,
    }

    def initialize(original, options)
      @original = original
      @options = options
    end

    def original_options
      @original.options
    end

    def parse
      regex = @original
      parsed = ""
      MAP.each do |meta, resolved_meta|
        if regex.match(meta)
          string = create_regex(resolved_meta)
        #require 'pry'; binding.pry
          parsed = regex.gsub(meta, string)
        end
      end
      parsed
    end

    def finish_regex(string)
      '[' + string + ']'
    end

    def create_regex(resolved_meta)
      new = resolved_meta.each_with_object("") { |letter, str| str << letter }
      finish_regex(new)
    end
  end
end
