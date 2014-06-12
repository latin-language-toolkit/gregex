require "gregex/version"

module Gregex
  require 'gregex/constants'
  require 'gregex/regex_parser'

  def self.new(regex)
    extended_rgx = RegexParser.new(regex).parse
    Regexp.new(extended_rgx)
  end
end
