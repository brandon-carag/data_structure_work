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
    new_node.next = @head
    @head, @current, @previous = new_node, new_node, nil
  end

  def find(item)
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

  def insert_after_current(item)
    raise "Please find an item first to set as current before insert" unless @current
    ....
  end

  def remove_current
    raise "Please find an item first to set as current before remove" unless @current
    ....
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
list.insert_after_current('xyz') #=> "Please find an item first to set as current before insert (RuntimeError)
puts list  #=> "789 -> abc -> xyz -> 123"
list.find('abc')
list.remove_current
puts list  #=> "789 -> xyz -> 123"
list.find(789)
list.remove_current
puts list  #=> "xyz -> 123"
list.find(456)
list.remove_current #=> "Please find an item first to set as current before remove (RuntimeError)"