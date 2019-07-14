# -*- ruby encoding: utf-8 -*-

class Reset
  VERSION = '1.0.0'

  def initialize(list)
    @values = list
  end

  def include?(element)
    @values.include? element
  end
end
