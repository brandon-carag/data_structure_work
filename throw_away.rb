class Node
  attr_accessor :value,:next,:previous

  def initialize(value, next_node = nil, previous_node = nil)
    @value = value 
    @next = next_node
    @previous = previous
  end

end

class DoublyLinkedList
  attr_accessor :head

  def initialize(node)
    @head = node 
  end

  def insert(value)
    node = Node.new(value, self.head, nil)
    self.head.previous = node
    self.head = node
  end

  def delete(value)
    crawler = self.head
    found = nil

    while crawler.next != nil
      if crawler.value == value
        found = crawler 
        break
      else
        crawler = crawler.next
      end
    end

    if found != nil && found.next != nil
      next_placeholder = crawler.next
      crawler.previous.next = next_placeholder
    end

    puts "====="
  end

  def list_node_values
    crawler = self.head
    while crawler.next != nil
      puts crawler.value
      crawler = crawler.next
    end
    puts crawler.value
  end

end

puts "Testing a doubly-linked list"
linked_list = DoublyLinkedList.new(Node.new("A"))
linked_list.insert("B")
linked_list.insert("C")
linked_list.insert("D")
linked_list.insert("E")
puts "Listing node values"
linked_list.list_node_values
linked_list.delete("B")
puts "Listing node values"
linked_list.list_node_values

class Stack
  attr_accessor :data_store

  def initialize
    @data_store = []
  end

  def push(item)
    @data_store << item
  end

  def pop
    @data_store.pop
  end

  def display 
    @data_store
  end

  def size
    "The stack's size is: #{@data_store.size}"
  end
end

stack = Stack.new
stack.push(1)
stack.push(3)
stack.push(9)
stack.pop
puts stack.display
puts stack.size

