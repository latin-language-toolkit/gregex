require "gregex/version"

module Gregex
  plain_letters = %w(α ε ι η ο υ ω β γ δ ζ θ κ λ μ ν ξ π ρ ῥ ῤ σ ς τ φ χ ψ)
  MAP = { '\w' => plain_letters }
  def self.new(regex)
    resolved = parse(regex)
    Regexp.new(resolved)
  end

  def self.parse(regex)
    string = regex.source
    MAP.each do |meta, resolves|
      if string.match(meta)
        string.gsub!(meta, Regexp.union(MAP[meta]).source)
      end
    end
    string
  end
end
