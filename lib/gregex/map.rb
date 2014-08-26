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

    def map
      if @opts.check_options("c")
        @regex_map['[α-ω]'] = select(:vowel)

        Gregex::Constants::VOWEL_NAMES.each do |str, name|
          @regex_map[str] = @gs.selection.select_by_letter(name).to_s
        end

      end
      @regex_map
    end

    private

    def regex_map
      { '\w' => @gs.all.to_s,
        '[α-ω]' => select(:vowel, :plain),
        '[^α-ω]' => select(:consonant),
        '[ά-ώ]' => select(:only_acute),
        '[ὰ-ὼ]' => select(:only_grave),
        '[ᾶ-ῶ]' => select(:only_circumflex),
        '[β-ψ]' => select(:consonant)
      }
    end

    def select(*args)
      meth = args.length > 1 ? "types" : "type"
      @gs.selection.send("select_by_#{meth}", *args).to_s
    end
  end
end
