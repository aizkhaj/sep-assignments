require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
    # like the specs, let's say this root = Node.new('The Matrix', 87). In all of the following methods, this is what will passed in as root.
  end

  def insert(root, node)
    # Our objective is to use DFS to compare whether node is larger or smaller than the root, where node.left = smaller and node.right = larger than root.
    if root == nil
      root = node
    elsif node.rating < root.rating
      root.left = insert(root.left, node)
    elsif node.rating > root.rating
      root.right = insert(root.right, node)
    end
    root
    # by returning root, we are returning the leaf that was set in place because root finally == nil.
  end

  # Recursive Depth First Search
  def find(root, data)
    # if node != nil
    #   find(node.left)
    #   puts node
    #   find(node.right) 
    # end
    
  end

  def delete(root, data)

  end

  # Recursive Breadth First Search
  def printf(children=nil)

  end
end
