require 'greek_string'
module Gregex
  class Map

    MAP = { '\w' => Gregex::Constants::ALL,
            '[α-ω]' => gs.select_by_types("vowel", "plain"),
            '[^α-ω]' => Gregex::Constants::CONSONANTS,
            '[ά-ώ]' => Gregex::Constants::VOWELS_WITH_ACUTE,
            '[ὰ-ὼ]' => Gregex::Constants::VOWELS_WITH_GRAVE,
            '[ᾶ-ῶ]' => Gregex::Constants::VOWELS_WITH_CIRCUMFLEX,
            '[β-ψ]' => Gregex::Constants::CONSONANTS,
    }

    def self.gs
      GreekString.new.selection
    end

    attr_reader :map

    def initialize(options)
      @opts = options
      @map = map
    end

    def map
      if @opts.check_options("c")
        then MAP['[α-ω]'] = Gregex::Constants::VOWELS + Gregex::Constants::VOWELS_WITH_SPIRITUS
      end
      MAP
    end
  end
end
