require 'pry'

class Node
  attr_accessor :value, :next_node

  def initialize(value,next_node)
    @value = value
    @next_node = next_node 
  end

  def print
    puts "My node's value is #{self.value} and the next node is #{self.next_node}"
  end

end

class SinglyList
  attr_accessor :head, :current

  def initialize(value,next_node)
    @head = Node.new(value,next_node)
    @current = nil
    puts "Node #{self.head.value} has been initialized"
  end

  def add(node)
    current = @head
    while current.next_node != nil
      current = current.next_node
    end
    current.next_node = Node.new(node,nil)
  end

  def find(find_value) 
    self.current = nil
    crawler = @head
    begin
      if crawler.value == find_value
        self.current = crawler
        break
      else
        crawler = crawler.next_node
      end
    end until crawler == nil
    puts "The find method found node #{self.current.value}." if self.current != nil
    puts "The find method did not find find value #{find_value} in the linked list" if self.current == nil
    self.current
  end

  def insert(item)
  end

  def remove
  end

  def size
    return 0 if @head == nil
    crawler = @head
    counter = 1
    while crawler.next_node != nil 
      counter += 1
      crawler = crawler.next_node
    end

    puts "This linked list is made up of #{counter} nodes."
  end

  def traverse
    current_node = self.head #Set a variable to be the head of the list
    while current_node.next_node != nil #While the pointer to the next node is not nil
      current_node.print #Print out information on the current node
      current_node = current_node.next_node 
      #but why is the subsequent execution failing?
    end
    current_node.print
  end

end

singlylist = SinglyList.new(1,nil)
singlylist.add(2)
singlylist.add(4)
singlylist.add(5)
singlylist.add(10)
singlylist.traverse
singlylist.find(5)
singlylist.find(6)
singlylist.size




