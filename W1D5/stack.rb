class Stack

  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    p @stack
  end

end

a = Stack.new
p a.add("what")
p a.add("why")
p a.add("who")
p a.remove
a.show
