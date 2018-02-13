class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack << item
    self.top = item
  end

  def pop
    if !empty?
      temp = @stack.last
      @stack = @stack[0...-1]
      self.top = @stack.last
      temp
    end
  end

  def empty?
    @stack.empty?
  end
end
