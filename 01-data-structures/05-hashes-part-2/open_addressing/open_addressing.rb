require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    index = index(key, size)
    if @items[index] != nil
      index = next_open_index(index(key, size))
      if index == -1
        resize
        index = next_open_index(index(key, size))
      end
    end    
    @items[index] = Node.new(key, value)
  end

  def [](key)
    index = index(key, size)
    while @items[index].key != key
      index == size ? index = 0 : index += 1
    end
    @items[index].value
  end
  
  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0
    key.each_codepoint {|x| sum += x}
    sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    while @items[index] != nil && index < size
      index += 1
    end
    
    if index == size
      return -1
    else
      return index
    end
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    old_array = @items
    new_size = size * 2
    @items = Array.new(new_size)
    
    old_array.each do |item|
      if item != nil
        @items[index(item.key, new_size)] = item
      end
    end
  end
end