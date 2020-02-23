class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

class Stack
  attr_reader :data

  def initialize
      @data = nil
  end

  def push(value)
      @data = LinkedListNode.new(value, @data)
  end

  def pop
      first_node = @data.value
      @data = @data.next_node
      return first_node
  end

end

def reverse_list(list)
  reverse_stack = Stack.new
  while list
    reverse_stack.push(list.value)
    list = list.next_node
  end
  return reverse_stack.data
end

def find_loop(list)
  fast_pointer = list
  slow_pointer = list
  while fast_pointer
    if fast_pointer
      puts "No loop found"
      fast_pointer = fast_pointer.next_node
    end
    if fast_pointer
      puts "No loop found"
      fast_pointer = fast_pointer.next_node
      slow_pointer = slow_pointer.next_node
    end
    if fast_pointer == slow_pointer
      puts "Loop found"
      return
    end
  end
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)

puts "-------"

revlist = reverse_list(node3)

print_values(revlist)

puts "-------"

node1.next_node = node3

find_loop(node3)