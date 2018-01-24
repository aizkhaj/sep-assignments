class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    item = index(key, size)

    resize unless @items[item] == nil || @items[item].value == value
    @items[item] = HashItem.new(key, value)
  end


  def [](key)
    item = index(key, size)
    @items[item].value
  end

  def resize
    old_array = @items
    @items = Array.new(size * 2)
    old_array.each do |item|
      unless item == nil
        @items[index(item.key, size)] = item
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0
    key.each_byte {|x| sum += x}
    # we sum the ascii value of each char on 'key'
    sum % size
    # our hashing function should be % by size of our @items array to deliver a unique ID.
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end