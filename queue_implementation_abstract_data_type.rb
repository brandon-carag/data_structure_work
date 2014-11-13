# Assignment: Implement the Queue abstract data type

# The queue abstract data type would have the following interfaces:

# Queue.new - creates a new queue
# enqueue(item) - adds an item to the rear of the queue
# dequeue() - removes a item from the front of the queue and returns that item
# empty? - returns true or false, depending on whether the queue is empty
# size - returns the number of items in a queue
# Your task for this assignment is to implement a queue in Ruby with an array as the underlying data structure.

require 'pry'

class Queue
  def initialize
    @elements = [] 
  end

  def enqueue(item)
    @elements.push(item)
  end

  def elements
    @elements
  end

  def set_elements(array)
    @elements = array
  end

  def dequeue
    @elements.shift
  end

  def empty?
    @elements.size == 0 
  end

  def peek
    @elements.first
  end

  def size
    @elements.size
  end

  def queue_items
    @elements
  end
end
