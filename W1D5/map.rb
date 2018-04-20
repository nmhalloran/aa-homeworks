require 'pry'

class Map
  attr_accessor :map

  def initialize
    @map = []
  end

  def assign(key, value)
    map.map.with_index do |k, i|
      binding.pry
      return map[i] = [key, value] if key == k[0]
    end
    map << [key, value]
  end

  def lookup(key)

  end

  def remove(key)
    binding.pry
    map.reject! { |k| k[0] == key }
    map
  end

  def show
    p map
  end
end

  a = Map.new
  a.assign("one", 2)
  a.assign("one", 5)
  a.assign("two", 4)
  a.remove("two")
  a.show
