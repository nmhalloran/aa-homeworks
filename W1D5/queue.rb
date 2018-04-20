class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
  end

  def show
    p @queue
  end

end

a = Queue.new
p a.enqueue("what")
p a.enqueue("why")
p a.enqueue("who")
p a.dequeue
a.show
