# If we have a binary tree, and are attempting to display each of the nodes in sequential order,
# you might think that we need to compare the value of the root_pointer to the child nodes and
# vice versa while traversing the tree.  However, we have to keep in mind that a binary tree is 
# also a logical data structure and thus the ordering is already baked in to it.  Thus, we really
# only need one method to execute recursively to traverse the entire tree.  Here's my attempt:

require 'pry'

class Node
  attr_accessor :value, :left_node, :right_node
  def initialize(value)
    @left_node = nil
    @right_node = nil
    @value = value
  end
end

class Queue
  attr_accessor :data_store

  def initialize
    @data_store = []
  end

  def enqueue(item)
    @data_store.push(item)
  end

  def dequeue
    @data_store.shift
  end

  def display 
    @data_store
  end

  def empty?
    @data_store.size == 0
  end

  def size
    @data_store.size
  end

  def head
    @data_store[0]
  end
end

class Tree
  attr_accessor :root_pointer

  def initialize(node)
    @root_pointer = node
    @parent_pointer = nil
  end

  def insert(node)
    original_root_pointer = @root_pointer
    flag = false

    while flag == false
      if @root_pointer.value > node.value
        if @root_pointer.left_node == nil
          @root_pointer.left_node = node
          flag = true
        else
          @root_pointer = @root_pointer.left_node
        end
      else
        if @root_pointer.right_node == nil
          @root_pointer.right_node = node
          flag = true
        else 
          @root_pointer = @root_pointer.right_node
        end
      end
    end

    @root_pointer = original_root_pointer
  end

def list_in_order(node)
  if node != nil #This is the base case that stops the function from executing
    list_in_order(node.left_node)
    puts "Node data is #{node.value}"
    list_in_order(node.right_node)
  end
end

def list_in_order_iterator(tree)
  root_pointer = tree.root_pointer
  parent_pointer = tree.parent_pointer

  while root_pointer.left_node != nil
    parent_pointer = root_pointer
    root_pointer = root_pointer.left_node
  end
  puts node.value
end

def list_in_reverse_order(node)
  if node != nil
    list_in_reverse_order(node.right_node)
    puts "The value of the node is #{node.value}" 
    list_in_reverse_order(node.left_node)
  end
end

def post_order_traversal(node)
  if node != nil
  puts "Post-order traversal shows #{node.value}"
  post_order_traversal(node.left_node)
  post_order_traversal(node.right_node)
  end
end

def pre_order_traversal(node)
  if node != nil
    pre_order_traversal(node.left_node)
    pre_order_traversal(node.right_node) 
    puts "Pre-order traversal shows #{node.value}"
  end
end

def depth_first_search(value,node)
  if node != nil
    depth_first_search(value, node.left_node)
    depth_first_search(value, node.right_node)
    if node.value == value
      return puts true
    end
  end
end

def max_depth
  max_depth = 0

end

def get_height(node)
  if node == nil
    return 0
  end

  [ get_height(node.left_node), get_height(node.right_node) ].max + 1
end

def is_balanced?(node)
  if root == nil 
    return true #Base Case
  end

  height_diff = get_height(root.left_node) - get_height(root.right)
  if height_diff.abs > 1 
    return false
  else
    return is_balanced(root.left_node) && is_balanced(root.right_node)
  end

end

#========= Queue is used as a supporting data structure for level_order_traversal


def level_order_traversal(node)
  return nil if node.nil?

  queue = Queue.new
  queue.enqueue(node)

  while queue.empty? == false
    queue.enqueue(node.left_node) if node.left_node != nil
    queue.enqueue(node.right_node) if node.right_node != nil
    puts node.value
    queue.dequeue
    node = queue.head
  end
  
end

end

#==========

tree = Tree.new(Node.new(7))
tree.insert(Node.new(3))
tree.insert(Node.new(10))
tree.insert(Node.new(1))

tree.list_in_order(tree.root_pointer) #1,3,7,10
tree.list_in_reverse_order(tree.root_pointer)
tree.post_order_traversal(tree.root_pointer)
tree.pre_order_traversal(tree.root_pointer)
tree.depth_first_search(1,tree.root_pointer)
tree.depth_first_search(100,tree.root_pointer)
puts tree.get_height(tree.root_pointer)

tree.level_order_traversal(tree.root_pointer)


def find_lowest_common_ancestor(node1,node2)
  node1_height = find_height(node1)
  node2_height = find_height(node2)
  difference = node2_height - node1_height

  balanced_node = node2_height - difference

  node_placeholder1
  node_placeholder2
  while node_placeholder1.parent != node_placeholder2.parent
    node_placeholder1 = node_placeholder1.parent
    node_placeholder2 = node_placeholder2.parent
  end

  return node1
end

