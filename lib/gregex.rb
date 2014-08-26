require "gregex/version"

class Gregex
  require 'greek_string'
  require 'gregex/regex_parser'

  attr_reader :gs

  def initialize
    @gs = GreekString.new
  end

  def regex(regex, opts = "")
    extended_rgx = RegexParser.new(regex, opts, gs)
    Regexp.new(extended_rgx.parse, extended_rgx.options)
  end
end
