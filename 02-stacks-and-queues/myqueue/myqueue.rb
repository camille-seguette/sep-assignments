class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def enqueue(element)
    @queue << element
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def dequeue
    if !empty?
      temp = head
      @queue = @queue[1..-1]
      @head = @queue.first
      @tail = @queue[-1]
      temp
    end
  end

  def empty?
    @queue.empty?
  end
end
