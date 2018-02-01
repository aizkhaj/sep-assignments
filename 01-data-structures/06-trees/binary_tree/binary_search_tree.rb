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
    if root == nil || root.title == data
      return root
    end
    
    if root.left
      find(root.left, data)
    elsif root.right
      find(root.right, data)
    end
  end

  def delete(root, data)
    # we need to locate our node object first, because data is always node.title. We can't compare a string with the root to iterate with.
    node = find(root, data)
    
    # return nil if root or data are nil.
    if root == nil || data == nil
      return nil
    end
    
    # locate our node and make links to root recursively, so that we can shift things around later until root returns what we need.
    if node.rating < root.rating
      root.left = delete(root.left, data)
    elsif node.rating > root.rating
      root.right = delete(root.right, data)
    else
      # if there are no children
      if root.left == nil && root.right == nil
        root = nil
      # if there is one child on the left 
      elsif root.right == nil
        return root.left
      # if there is one child on the right
      elsif root.left == nil
        return root.right
      # if there are two children
      else
      #find minimum and then return it
        root = findmin(root.right)
        return root
      end
    end
  end
    
  # write a function to find minimum
  def findmin(root)
    if root.left == nil
      return root
    else 
      findmin(root.left)
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)

  end
end
