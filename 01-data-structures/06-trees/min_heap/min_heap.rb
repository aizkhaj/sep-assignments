require_relative 'node'

class MinHeap
  # for our min heap to work, all parent nodes have to be smaller than children nodes.

  def initialize(root)
    @root = root
    # like the specs, let's say this root = Node.new('The Matrix', 67). In all of the following methods, this is what will passed in as root.
  end
  
  def insert(root, node)
    parent = root

    if node.rating > parent.rating && !parent.left
      parent.left = node
    elsif node.rating > parent.rating && !parent.right
      parent.right = node
    else
      childless_parent = find_childless_parent(root)
      parent = insert(childless_parent, node)
    end
  end

  def find_childless_parent(root)
    queue = Queue.new
    queue.enq(root)

    while !queue.empty?
      parent = queue.deq

      if parent.left && parent.right
        queue.enq(parent.left)
        queue.enq(parent.right)
      else
        return parent
      end
    end
  end

  def find(root, data)
    queue = Queue.new
    queue.enq(root)

    while !queue.empty?
      node = queue.deq
      return nil if node == nil

      if node.title == data
        return node
      else
        queue.enq(node.left)
        queue.enq(node.right)
      end
    end
  end

  def delete(root, data)
    node = find(root, data)
    parent = find_parent(root, node)
    
    # return nil if root or data are nil.
    if root == nil || data == nil
      return nil
    end

    if parent.left == node
      parent.left = nil
    elsif parent.right == node
      parent.right = nil
    end
  end

  def find_parent(root, node)
    return nil if node == nil
    
    queue = Queue.new
    queue.enq(root)

    while !queue.empty?
      parent = queue.deq

      return nil if parent == nil

      if parent.left == node || parent.right == node
        return parent
      else
        queue.enq(parent.left)
        queue.enq(parent.right)
      end
    end
  end

  def print
    queue = Queue.new
    queue.enq(@root)
    
    while !queue.empty?
      node = queue.deq
      
      if node.title != nil
        puts "#{node.title}: #{node.rating}"
      end
      
      if node.left
        queue.enq(node.left)
      end

      if node.right
        queue.enq(node.right)
      end
    end
  end
end
