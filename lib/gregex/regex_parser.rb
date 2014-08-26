class Gregex
  class RegexParser
    require 'gregex/options'
    require 'gregex/map'

    attr_reader :options

    def initialize(original, options, gs)
      @original = original
      @options = Gregex::Options.new(@original.options, options)
      @map = Gregex::Map.new(@options, gs).map
    end

    def parse
      regex = @original.source
      match_pairs = create_matching_regex_patterns
      match_pairs.keys.each do |k|
        regex.gsub!(k, match_pairs)
      end
      regex
    end

    private

    def create_matching_regex_patterns
      @map.each_with_object({}) do |(meta, resolved_meta), hsh|
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
