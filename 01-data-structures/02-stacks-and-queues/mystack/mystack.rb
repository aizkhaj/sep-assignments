class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    # this method should add an element at the end of @stack, an array.
    @stack.insert(-1, item)
    self.top = @stack[-1]
  end

  def pop
    # this method should remove an element at the end of @stack and return the item that was popped.
    item = @stack.last
    @stack.delete_at(-1)
    self.top = @stack[-1]
    item
  end

  def empty?
    if @stack == []
      true
    else
      false
    end
  end
end