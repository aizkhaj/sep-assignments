class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def enqueue(element)
    @queue.insert(-1, element)
    @head = @queue.first
    @tail = @queue.last
  end

  def dequeue
    item = @queue
    @queue.delete_at(0)
    @head = @queue.first
    @tail = @queue.last
    item
  end

  def empty?
    if @queue == []
      true
    else
      false
    end
  end
end