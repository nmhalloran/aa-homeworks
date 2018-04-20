require 'pry'

class Map
  attr_accessor :map

  def initialize
    @map = []
  end

  def assign(key, value)
    map.map.with_index do |k, i|
      return map[i] = [key, value] if key == k[0]
    end
    map << [key, value]
  end

  def lookup(key)
    map.each { |k| return k[1] if k[2] == key}
    nil
  end

  def remove(key)
    map.reject! { |k| k[0] == key }
    nil
  end

  def show
    map
  end
end

  a = Map.new
  a.assign("one", 2)
  a.assign("one", 5)
  a.assign("two", 4)
  a.remove("two")
  p a.show
