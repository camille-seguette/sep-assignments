class HashClass

  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    hash_item = @items[index(key, @size)]
    if hash_item.nil?
      @items[index(key, @size)] = HashItem.new(key, value)
    elsif hash_item.key != key
      resize
      re_index = index(key, @size)
      self[key] = value
    elsif hash_item.key == key && hash_item.value != value
      resize
      hash_item.value = value
    end
  end


  def [](key)
    item = @items[index(key, @size)]
    item.nil? ? nil : item.value
  end

  def resize
    @size = @size * 2
    new_hash = Array.new(@size)
    @items.each do |item|
      if item != nil
        new_hash[index(item.key, @size)] = item
      end
    end
    @items = new_hash
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

end
