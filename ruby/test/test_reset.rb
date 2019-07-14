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

    it "creates an empty reset when created with no parameters" do
      @reset = Reset.new
      assert_equal @reset.size, 0
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

    it "returns the updated reset" do
      @reset = Reset.new([1])
      result = @reset.add(2)
      assert_equal @reset.object_id, result.object_id
    end
  end

  describe "#union" do
    it "should return only the unique members of each Reset" do
      @reset_one = Reset.new [1, 3]
      @reset_two = Reset.new [2, 4]
      @result = @reset_one.union(@reset_two)
      assert_equal @result.size, 4
      assert @result.include? 1
      assert @result.include? 3
      assert @result.include? 2
      assert @result.include? 4
    end

    it "should not include duplicates" do
      @reset_one = Reset.new [1, 2, 3]
      @reset_two = Reset.new [2, 3]
      @result = @reset_one.union(@reset_two)
      assert_equal @result.size, 3
      assert @result.include? 1
      assert @result.include? 2
      assert @result.include? 3
    end

    it "works with arrays" do
      @reset= Reset.new [1, 2, 3]
      @array = [2, 3]
      @result = @reset.union(@array)
      assert_equal @result.size, 3
      assert @result.include? 1
      assert @result.include? 2
      assert @result.include? 3
    end
  end

  describe "#intersection" do
    it "should return only the unique members of each Reset" do
      @reset_one = Reset.new [1, 2, 3]
      @reset_two = Reset.new [2, 3, 4]
      @result = @reset_one.intersection(@reset_two)
      assert_equal @result.size, 2
      assert @result.include? 3
      assert @result.include? 2
      assert !@result.include?(1)
      assert !@result.include?(4)
    end

    it "works with arrays" do
      @reset= Reset.new [1, 2, 3]
      @array = [2, 3, 4]
      @result = @reset.intersection(@array)
      assert_equal @result.size, 2
      assert @result.include? 3
      assert @result.include? 2
      assert !@result.include?(1)
      assert !@result.include?(4)
    end
  end

  describe "#difference" do
    it "should return all members of the first reset that are not in the second" do
      @reset_one = Reset.new [1, 2, 3]
      @reset_two = Reset.new [2, 3, 4]
      @result = @reset_one.difference(@reset_two)
      assert_equal @result.size, 1
      assert @result.include?(1)
      assert !@result.include?(3)
      assert !@result.include?(2)
      assert !@result.include?(4)
    end

    it "should return all members of the first reset that are not in the second (case #2)" do
      @reset_one = Reset.new [1, 2, 3]
      @reset_two = Reset.new [2, 3, 4]
      @result = @reset_two.difference(@reset_one)
      assert_equal @result.size, 1
      assert @result.include?(4)
      assert !@result.include?(1)
      assert !@result.include?(2)
      assert !@result.include?(3)
    end
  end

  describe "#subset" do
    it "returns true if the first reset is a subset of the second" do
      @reset_one = Reset.new [1, 2, 3]
      @reset_two = Reset.new [1, 2, 3, 4]
      assert @reset_one.subset(@reset_two)
    end

    it "returns false if the first reset is NOT a subset of the second" do
      @reset_one = Reset.new [1, 2, 5]
      @reset_two = Reset.new [1, 2, 3, 4]
      assert !@reset_one.subset(@reset_two)
    end
  end
end
