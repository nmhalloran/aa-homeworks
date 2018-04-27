class LRUCache
  attr_reader :cache
  def initialize(max_size)
    @max_size = max_size
    @cache = []
  end

  def count
    @cache.length
  end

  def add(el)
    cache.push(el)
    cache.shift if count > @max_size
    cache
  end

  def show
    cache
  end

  private

  def push(el)
    @cache.push(el)
  end

  def shift
    @cache.shift
  end

end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

p johnny_cache.count # => returns 2

p johnny_cache.add([1,2,3])
p johnny_cache.add(5)
p johnny_cache.add(-5)
p johnny_cache.add({a: 1, b: 2, c: 3})
p johnny_cache.add([1,2,3,4])
p johnny_cache.add("I walk the line")
p johnny_cache.add(:ring_of_fire)
p johnny_cache.add("I walk the line")
p johnny_cache.add({a: 1, b: 2, c: 3})


p johnny_cache.show
