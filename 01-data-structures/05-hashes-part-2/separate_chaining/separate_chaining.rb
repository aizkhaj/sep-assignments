require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    # COMPUTE the hash code for key, ASSIGN to index
    # GET array[index], ASSIGN to oldHead
    # SET array[index] to a link that contains key and value
    # IF oldHead exists THEN
    #   SET oldHead as the second link in the chain.
    #   # it's like saying temp_head = @head.next
    # END
    index = index(key, size)
    new_item = Node.new(key, value)
    
    if @items[index] == nil
      @items[index] = LinkedList.new
    end

    @items[index].add_to_front(new_item)
    resize if load_factor > @max_load_factor
  end 

  def [](key)
    # COMPUTE the hash code for key, ASSIGN to index
    # GET array[index], ASSIGN to head
    # IF head exists THEN
    #   WHILE the next link in the chain exists
    #     IF the key at the current link equals key THEN
    #       RETURN this links value
    #     END
    #     SET the current link to the next link in the chain
    #   END
    # END
    # RETURN nothing
    index = index(key, size)
    item = @items[index].head
    while item.key != key
      item = item.next
    end
    item.value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0
    key.each_codepoint {|k| sum += k}
    sum % size 
  end

  # Calculate the current load factor
  def load_factor
    # load factor formula: number of locations occupied / size
    # how do we calculate the number of occupied buckets in @items? we loop through an array and check for a value until it is nil, or if count == size.  
    occupied = 0
    @items.each do |list|
      if list != nil
        item = list.head
        occupied += 1
        while item.next != nil
          item = item.next
          occupied += 1
        end
      end
    end
    result = occupied * 1.0 / size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    old_hash = @items
    new_size = size * 2
    @items = Array.new(new_size)
    
    old_hash.each do |list|
      unless list == nil
        while list.head != nil
          item = list.head
          i = index(item.key, size)
          if @items[i] == nil
            @items[i] = LinkedList.new
          end
          @items[i].add_to_front(Node.new(item.key, item.value))
          list.remove_front
        end
      end
    end
  end

end
