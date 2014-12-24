require 'pry'

class HashTable
  def initialize(max_size)
    @max_size = max_size
    @keys = Array.new(max_size) #Why would the keys be an array?
    @values = Array.new(max_size) #Why would the values be an array?
  end

  def put(key, value)
    hash_value = hash_function(key)
    while @keys[hash_value] != nil
      hash_value += 1
    end
    @keys[hash_value] = key
    @values[hash_value] = value
  end

  def get(key)
    #How do we check to ensure that we're retrieving the appropriate address
    #for the given key?
    #Since the output of the hash_function is the same for the inputs in question
    #How do we determine whether the address of the function is appropriate?
    #It would seem we need a record of all the inputs that do exist.
    #We would have to know the sequence of insertion

    hash_value = hash_function(key)
    while @keys[hash_value] != key 
      hash_value += 1
    end

    @values[hash_value]
  end

  def hash_function(key)
    key.chars.map{|char|char.ord}.reduce(:+)%128
  end

  def [](key)
    hash_value = hash_function(key)
    while @keys[hash_value] != key 
      hash_value += 1
    end

    @values[hash_value]
  end

  def []=(key,value)
    hash_value = hash_function(key)
    while @keys[hash_value] != nil
      hash_value += 1
    end
    @keys[hash_value] = key
    @values[hash_value] = value
  end

  def keys
    @keys 
  end

  def values
    @values
  end

  def size
    if @keys.size == @values.size
      @keys.size
    else
      puts "There was an error calculating array size"
    end
  end

  def capacity 
    capacity = (@keys.compact.size.to_f)/@keys.size
    puts "The capacity of the array is #{capacity}"
    capacity
  end

  def resize
    #Check whether capacity is above 70%
    #If it is create a new hash table, modfiy the hashing function?
    #

  end

end

hash_table = HashTable.new(128)
hash_table.put("abc", 123)
hash_table.put("xyz", 456)
hash_table.put("cba", 789)

puts hash_table.get("abc")
puts hash_table.get("xyz")
puts hash_table.get("cba")

puts hash_table["abc"]
hash_table["brandon"] = "carag"
puts hash_table["brandon"]
puts hash_table.keys
puts hash_table.size
hash_table.capacity