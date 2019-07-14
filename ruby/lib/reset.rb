# -*- ruby encoding: utf-8 -*-

class Reset
  VERSION = '1.0.0'

  def initialize(list)
    @values = list.to_a.uniq
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
  end

  def to_a
    @values
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
end
