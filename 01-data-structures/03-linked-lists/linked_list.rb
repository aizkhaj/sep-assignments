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
    if @head == @tail
      @head = @tail = nil
    elsif @head.next == @tail
      @head.next = nil
      @tail = @head
    else
      temporary_node = @head
      while temporary_node.next != @tail
        temporary_node = temporary_node.next
      end
      @tail = temporary_node
    end
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
    # Here, we search for node location first.
    track_node = @head
    if @head == node
      @head = track_node.next
    else  
      while track_node.next != nil && track_node.next != node
        track_node = track_node.next
      end

      if track_node.next == @tail
        @tail = track_node
      else
        node_to_replace = track_node.next
        track_node.next = node_to_replace.next
      end
    end

    # The following are some of my previous attempts/incomplete thoughts at achieving this method.

    # if track_node == node
    #   # if @head == 
    #     @head = @track_node.next
    #   # end
    # end


    # # if there's only one node
    # if @head == @tail && @head || @tail == node
    #   @head = @tail == nil
    # elsif @head.next == @tail && @head.next || @tail == node
    #   @head = @tail
    #   @head.next == nil
    # end

    # if @head.next == node
    #   temporary_node.next = @head.next
    #   @head.next = nil

    # end
    # # if there are more than one nodes
    # while temporary_node.next == nil
    #   temporary_node = temporary_node.next
    # end
    # @head.next = temporary_node

  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head == nil
      @head = node
      @tail = node
    else
      temporary_node = @head
      @head = node
      node.next = temporary_node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    @head = @head.next
  end
end