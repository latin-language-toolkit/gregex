require "gregex/version"

module Gregex
  require 'gregex/constants'
  require 'gregex/regex_parser'
  require 'gregex/options'

  def self.new(regex, opts = "")
    extended_rgx = RegexParser.new(regex, opts)
    Regexp.new(extended_rgx.parse, extended_rgx.options)
  end
end
