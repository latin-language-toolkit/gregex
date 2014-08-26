class Gregex
  class Options

    def initialize(orig, opts)
      @original = orig
      @options = opts
      options
    end

    def options
      parse_options
      if @options.empty? then 0 else @options end
    end

    def parse_options
      int = @original
      if int.odd? && !check_options("i")
        @options << "i"
      end
    end

    def check_options(arg)
      true if @options.match(/#{arg}/)
    end

  end
end
