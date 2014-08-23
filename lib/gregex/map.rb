require 'greek_string'
module Gregex
  class Map

    def self.gs
      GreekString.new.selection
    end

    MAP = { '\w' => Gregex::Constants::ALL,
            '[α-ω]' => gs.select_by_types("vowel", "plain"),
            '[^α-ω]' => Gregex::Constants::CONSONANTS,
            '[ά-ώ]' => Gregex::Constants::VOWELS_WITH_ACUTE,
            '[ὰ-ὼ]' => Gregex::Constants::VOWELS_WITH_GRAVE,
            '[ᾶ-ῶ]' => Gregex::Constants::VOWELS_WITH_CIRCUMFLEX,
            '[β-ψ]' => Gregex::Constants::CONSONANTS,
    }

    attr_reader :map

    def initialize(options)
      @opts = options
      @map = map
    end

    def map
      if @opts.check_options("c")
        MAP['[α-ω]'] = Gregex::Constants::VOWELS + Gregex::Constants::VOWELS_WITH_SPIRITUS
        MAP['α'] = Gregex::Map.gs.select_by_letter("Alpha").to_s
        MAP['ε'] = Gregex::Map.gs.select_by_letter("Epsilon").to_s
        MAP['η'] = Gregex::Map.gs.select_by_letter("Eta").to_s
        MAP['ι'] = Gregex::Map.gs.select_by_letter("Iota").to_s
        MAP['υ'] = Gregex::Map.gs.select_by_letter("Ypsilon").to_s
      end
      MAP
    end
  end
end
