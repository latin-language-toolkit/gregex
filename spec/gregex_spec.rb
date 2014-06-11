require 'spec_helper'

describe Gregex do
  it 'should have a version number' do
    Gregex::VERSION.should_not be_nil
  end

  describe ".new" do
    it 'with \w' do
      regex = Gregex.new(/\w/)
      "ι".match(regex)
    end
  end
end
