class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    index = index(key, size)

    if @items[index] == nil || @items[index].value == value
      @items[index] = HashItem.new(key, value)
    else
      resize
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
    old_array.each do |item|
      if item != nil
        @items[index(item.key, new_size)] = item
      end
    end
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