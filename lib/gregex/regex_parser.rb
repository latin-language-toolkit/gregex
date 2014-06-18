module Gregex
  class RegexParser

    MAP = { '\w' => Gregex::Constants::ALL,
            '[α-ω]' => Gregex::Constants::PLAIN_VOWELS,
            '[^α-ω]' => Gregex::Constants::CONSONANTS,
            '[ά-ώ]' => Gregex::Constants::VOWELS_WITH_ACUTE,
            '[ὰ-ὼ]' => Gregex::Constants::VOWELS_WITH_GRAVE,
            '[ᾶ-ῶ]' => Gregex::Constants::VOWELS_WITH_CIRCUMFLEX,
            '[β-ψ]' => Gregex::Constants::CONSONANTS,
    }

    def initialize(original, options)
      @original = original
      @options = options
    end

    def parse_options
      int = @original.options
      if int.odd? && !check_options("i")
        @options << "i"
      end
    end

    def options
      parse_options
      if @options.empty? then 0 else @options end
    end

    def check_options(arg)
      true if @options.match(/#{arg}/)
    end

    def parse
      regex = @original.source
      match_pairs = create_matching_regex_patterns
      match_pairs.keys.each do |k|
        regex.gsub!(k, match_pairs)
      end
      regex
    end

    def create_matching_regex_patterns
      MAP.each_with_object({}) do |(meta, resolved_meta), hsh|
        key = meta
        value = create_regex(resolved_meta)
        hsh[key] = value
        hsh
      end
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
