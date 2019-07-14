# -*- ruby encoding: utf-8 -*-

gem 'minitest'
require "minitest/autorun"
require "reset"

describe Reset do
  describe ".new" do
    it "removes all duplicates of the initial list of elements" do
      @reset = Reset.new([1, 2, 2])
      assert_equal @reset.size, 2
    end
  end

  describe "#include?" do
    before do
      @reset = Reset.new([1,2,3])
    end

    it "returns true when the element exists in the reset" do
      assert @reset.include? 1
    end

    it "returns false when the element doesn't exist in the reset" do
      assert !@reset.include?(4)
    end
  end

  describe "#add" do
    it "should insert a new element in the Reset" do
      @reset = Reset.new([])
      @reset.add(1)
      assert @reset.include?(1)
    end

    it "should not insert an in the Reset if it's alredy in it" do
      @reset = Reset.new([1])
      assert_equal(@reset.size, 1)
      @reset.add(1)
      assert_equal @reset.size, 1
    end
  end
end
