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

  def union(reset)
    Reset.new(@values + reset.to_a)
  end

  def intersection(reset)
    Reset.new(@values.select { |elem| reset.include? elem })
  end

  def difference(reset)
    Reset.new(@values.select { |elem| !reset.include?(elem) })
  end

  def subset(reset)
    @values.all? { |elem| reset.include? elem }
  end

  def include?(element)
    @values.include? element
  end

  def size
    @values.size
  end

  def add(element)
    unless @values.include? element
      @values << element
    end
    self
  end

  def to_a
    @values
  end
end
