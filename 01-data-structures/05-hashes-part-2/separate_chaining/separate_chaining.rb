require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @data = Array.new(size)
  end

  def []=(key, value)
    i = index(key, @data.size)
    n = Node.new(key, value)
    if @data[i].nil?
      @data[i] = LinkedList.new
      @data[i].add_to_tail(n)
    else
      @data[i].add_to_tail(n)
    end
    if load_factor >= @max_load_factor
      resize
    end
  end

  def [](key)
    i = index(key, @data.size)
    if @data[i].nil?
      nil
    else
      temp = @data[i].head
      while temp != nil
        if temp.key == key
          result = temp.value
          return result
        end
          temp = temp.next
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    count = 0
    @data.each do |list_item|
      if list_item != nil
        count = count + list_item.size
      end
    end
    return count.to_f / size
    # TEST FAIL: returns the number of items in the hash divided by the size of the underlying array
  end

  # Simple method to return the number of items in the hash
  def size
    @data.length
  end

  # Resize the hash
  def resize
    temp = @data
    @data = Array.new(@data.size * 2)
    temp.each do |list|
      # movies["Empire Strikes Back"] = "Excellent"
      if list != nil
        current_item = list.head
        while current_item != nil
          self[current_item.key] = current_item.value
          current_item = current_item.next
        end
      end
    end
  end
end
