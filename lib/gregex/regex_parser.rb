module Gregex
  class RegexParser

    MAP = { '\w' => Gregex::Constants::ALL }

    def initialize(original)
      @original = original
    end

    def parse
      regex = @original.source
      MAP.each do |meta, resolved_meta|
        if regex.match(meta)
          string = create_regex(resolved_meta)
          regex.gsub!(meta, string)
        end
      end
      regex
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
