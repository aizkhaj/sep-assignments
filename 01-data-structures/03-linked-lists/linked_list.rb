require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @tail == nil
      @tail = node
      @head == nil ? @head = node : @head.next = @tail
    else
      @tail.next = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    @head.next = @tail
    @tail = nil
    @tail.next = nil
  end

  # This method prints out a representation of the list.
  def print
    current_node_data = @head
      
    while current_node_data != nil
      puts current_node_data.data
      current_node_data = current_node_data.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
  end
end