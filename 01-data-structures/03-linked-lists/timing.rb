require 'benchmark'
require_relative 'linked_list'

n = 50000

Benchmark.bm(7) do |x|
  x.report("10000 array time")   { a = Array.new(10000) }
  x.report("10000 linked list time") { l = LinkedList.new ; 10000.times { |i| l.add_to_tail(Node.new(i)) } ; }
  x.report("access 5000th element of array")  { a = Array.new(4999) ; a[4999] }
  x.report("access 5000th node in linked list") { l = LinkedList.new ; 5000.times { |i| l.remove_tail() } ; }
  x.report("remove 5000th element of array") { a = Array.new(4999) ; a.pop() }
  x.report("remove 5000th node in linked list") { l = LinkedList.new ; l.remove_tail() }
end
