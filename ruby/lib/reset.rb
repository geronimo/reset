# -*- ruby encoding: utf-8 -*-

##
# This class is yet another implementation of the abstract data type Set
# It stores values without any particular order, and no repeated
# values.

class Reset
  VERSION = '1.0.0'

  ##
  # Creates a new Reset using a +list+ of elements.
  #
  # It receives any enumerable that can be transformed into a string. If
  # the +list+ is not provided, the Reset is empty.
  def initialize(list=[])
    @values = list.to_a.uniq
  end

  ##
  # Returns a new Reset containing the unique members of self and
  # the reset sent as parameter.
  def union(reset)
    reset = Reset.new(reset) unless reset.instance_of? Reset
    Reset.new(@values + reset.to_a)
  end

  ##
  # Returns a new Set of all objects that are members of both sets.
  def intersection(reset)
    reset = Reset.new(reset) unless reset.instance_of? Reset
    Reset.new(@values.select { |elem| reset.include? elem })
  end

  ##
  # Returns a new Set of all members of the first set
  # that are not part of the second set.
  def difference(reset)
    reset = Reset.new(reset) unless reset.instance_of? Reset
    Reset.new(@values.select { |elem| !reset.include?(elem) })
  end

  ##
  # Tests whether the first set is a subset of the second set.
  def subset(reset)
    reset = Reset.new(reset) unless reset.instance_of? Reset
    @values.all? { |elem| reset.include? elem }
  end

  ##
  # Tests if the reset contains the given element
  def include?(element)
    @values.include? element
  end

  ##
  # Returns the size of the reset
  def size
    @values.size
  end

  ##
  # Adds a new element to the reset. If the element is already included,
  # it ignores it.
  def add(element)
    unless @values.include? element
      @values << element
    end
    self
  end

  ##
  # Convert a reset to array
  def to_a
    @values
  end
end
