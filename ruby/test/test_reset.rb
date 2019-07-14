# -*- ruby encoding: utf-8 -*-

gem 'minitest'
require "minitest/autorun"
require "reset"

describe Reset do
  describe "#include?" do
    it "returns true when the element exists in the reset" do
      @reset = Reset.new([1,2,3])
      assert @reset.include? 1
    end

    it "returns false when the element doesn't exist in the reset" do
      @reset = Reset.new([1,2,3])
      assert !@reset.include?(4)
    end
  end
end
