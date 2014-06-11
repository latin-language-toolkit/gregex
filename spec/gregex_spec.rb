require 'spec_helper'

describe Gregex do
  let(:plain_letters) { %w(α ε ι η ο υ ω β γ δ ζ θ κ λ μ ν ξ π ρ ῥ ῤ σ ς τ φ χ ψ) }
  it 'should have a version number' do
    Gregex::VERSION.should_not be_nil
  end

  describe ".new" do
    it 'with \w' do
      regex = Gregex.new(/\w/)
      #require 'pry'; binding.pry;
      plain_letters.each do |letter|
        expect(regex).to match(letter)
      end
    end
  end
end
