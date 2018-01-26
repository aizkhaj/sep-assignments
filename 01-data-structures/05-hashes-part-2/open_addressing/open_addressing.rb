require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    # index = index(key, size)
    # if @items[index] == nil
    #   # If the place in array is nil, add this new item in place.
    #   @items[index] = HashItem.new(key, value)
    # elsif @items[index].key == key && @items[index].value != value
    #   # if inserted item's key matches an existing key && their values don't match, then it is a collision. Try the next_open_index.
    #   next_open_index(index)
    # elsif @items[index].key != key
    #   # if inserted item's key does not match with any available key, then the hash has run out of places to store this item. So you resize the internal array and then run the insertion again using recursion.
    #   resize
    #   self.[]=(key, value)
    # end
  end

  def [](key)
    index = index(key, size)
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
    while @items[index] != nil
      index += 1
    end
    return index
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
    puts "old array: #{old_array}"
    
    old_array.each do |item|
      if item != nil
        @items[index(item.key, new_size)] = item
      end
    end
    puts "new array: #{@items}"
  end
end