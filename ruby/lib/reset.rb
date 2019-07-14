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
end
