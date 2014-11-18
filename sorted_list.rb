require 'pry'

class SortedList
  attr_accessor :items

  def initialize
    @items = []
  end

  def add(item)
    insertion_point = nil 
    @items.each_with_index do |element,index|
      if element > item
        insertion_point = index
        break
      end
    end

    insertion_point = @items.size if insertion_point == nil #If item being inserted is the largest one in the array
    @items.insert(insertion_point, item) 
  end

  def remove(item)
    @items.each_with_index do |element,index|
      @items.delete_at(index) if element == item 
    end
  end

  def to_s
    @items.to_s
  end
end

list = SortedList.new
list.add(3)
list.add(8)
list.add(4)
list.add(9)
list.add(1)
puts list    #=> [1, 3, 4, 8, 9]
list.remove(4)
puts list #=> [1, 3, 8, 9]



