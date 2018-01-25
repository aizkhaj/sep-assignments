class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    index = index(key, size)
    
    # if @items[index] == nil || @items[index].value == value
    #   @items[index] = HashItem.new(key, value)
    # else
    #   resize
    # end

    if @items[index] == nil
      # If the place in array is nil, add this new item in place.
      @items[index] = HashItem.new(key, value)
    elsif @items[index].key == key && @items[index].value != value
      # if inserted item's key matches an existing key && their values don't match, then it is a collision. Resize the array.
      resize
    elsif @items[index].key != key
      # if inserted item's key does not match with any available key, then the hash has run out of places to store this item. So you resize the internal array and then run the insertion again using recursion.
      resize
      self.[]=(key, value)
    end

    puts "HashClass: #{@items}"
  end


  def [](key)
    index = index(key, size)
    @items[index].value
  end

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

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0
    key.each_codepoint {|x| sum += x}
    # we sum the ascii value of each char on 'key'
    sum % size
    # our hashing function should be % by size of our @items array to deliver a unique ID.
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end