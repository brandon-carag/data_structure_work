require 'pry'

class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
  end

  def tail?
    @next.nil?
  end
end

class SinglyList
  def add(item)
    new_node = Node.new(item) 
    new_node.next = @head #Perhaps the implementation is that it adds it to the beginning of the linked list
    @head = new_node
    @current = new_node #current is like a crawler, but it's also a marker to where we are at in the traversal
    @previous = nil
  end

  def find(item) #Used to set @current
    @current, @previous = @head, nil
    begin
      if @current.data == item
        return @current.data
      else
        @previous, @current = @current, @current.next
      end
    end until @current.tail?
    @current = nil
  end

  def insert_before_current(item)
    raise "Please find an item first to set as current before insert" unless @current
    #Create a new_node and set the value to the argument passed in
    #Change the value of the previous node's next instance variable so it references the newly created node
    #Set the next of the new_node so that its next references @current
    #Set the value of @previous so it references the new node

    new_node = Node.new(item)
    @previous.next = new_node
    new_node.next = @current
    @previous = new_node

  end

  def insert_after_current(item)
    raise "Please find an item first to set as current before insert" unless @current
    #Create a new node and set its value to the passed in argument
    #Make sure the new node is set to the current node's next value
    #Change the current node so that its next value is set to the new node
    new_node = Node.new(item)
    new_node.next = @current.next
    @current.next = new_node
  end

  def remove_current
    raise "Please find an item first to set as current before remove" unless @current
    #Is it necessary to destroy the instance to the object?
    #Edge cases: current is the head, no other nodes, current is the tail
    if @current == @head
      @head = @current.next
    elsif @current.tail?
      @previous.next = nil
    else
      @previous.next = @current.next
    end

    @current = nil
  end

  def size
    node = @head
    counter = 1
    while !node.tail?
      node = node.next
      counter += 1
    end
    counter
  end

  def to_s
    node = @head
    list_string = node.data.to_s
    while !node.tail?
      node = node.next
      list_string += " -> #{node.data}"
    end
    list_string
  end
end

list = SinglyList.new
list.add(123)
puts list.size  #=> 1
list.add('abc')
list.add(789)
puts list
puts list.size  #=> 3
list.find('abc')
list.insert_after_current('xyz')
list.find('456')
# list.insert_after_current('xyz') #=> "Please find an item first to set as current before insert (RuntimeError)
puts list  #=> "789 -> abc -> xyz -> 123"
list.find('abc')
list.remove_current
puts list  #=> "789 -> xyz -> 123"
list.find(789)
list.remove_current
puts list  #=> "xyz -> 123"
list.find(456)
# list.remove_current #=> "Please find an item first to set as current before remove (RuntimeError)"