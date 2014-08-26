require 'greek_string'
class Gregex
  class Map
    require 'gregex/constants'

    attr_reader :map

    def initialize(options, gs)
      @opts = options
      @gs = gs
      @regex_map = regex_map
      @map = map
    end

    def regex_map
      { '\w' => Gregex::Constants::ALL,
        '[α-ω]' => @gs.selection.select_by_types("vowel", "plain"),
        '[^α-ω]' => Gregex::Constants::CONSONANTS,
        '[ά-ώ]' => Gregex::Constants::VOWELS_WITH_ACUTE,
        '[ὰ-ὼ]' => Gregex::Constants::VOWELS_WITH_GRAVE,
        '[ᾶ-ῶ]' => Gregex::Constants::VOWELS_WITH_CIRCUMFLEX,
        '[β-ψ]' => Gregex::Constants::CONSONANTS,
      }
    end

    def map
      if @opts.check_options("c")
        @regex_map['[α-ω]'] = Gregex::Constants::VOWELS + Gregex::Constants::VOWELS_WITH_SPIRITUS
        Gregex::Constants::VOWEL_NAMES.each do |str, name|
          @regex_map[str] = @gs.selection.select_by_letter(name).to_s
        end
      end
      @regex_map
    end
  end
end
