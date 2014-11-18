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
    #How do we check to ensure 
    hash_value = hash_function(key)
    while @values[hash_value] != key && hash_value <= @values.size
      hash_value += 1
    end


  end

  def hash_function(key)
    key.chars.map{|char|char.ord}.reduce(:+)%128
  end
end

hash_table = HashTable.new(128)
hash_table.put("abc", 123)
hash_table.put("xyz", 456)
hash_table.put("cba", 789)

puts hash_table.get("abc")
puts hash_table.get("xyz")
puts hash_table.get("cba")