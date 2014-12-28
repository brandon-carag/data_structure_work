#This quicksort implementation is not complete yet.
require 'pry'

def quick_sort(array, min_index, max_index)
  if max_index > min_index
    puts "Quick sort is working with the following array: #{array}.  It's min_index is #{min_index} and max_index is #{max_index}"
    # binding.pry
    pivot_index_location = partition(array, min_index, max_index)
    puts "The pivot index location is #{pivot_index_location}"
    quick_sort(array, min_index, pivot_index_location - 1)
    quick_sort(array, pivot_index_location + 1, max_index)
  end
end

def partition(array, min_index, max_index)
  pivot = array[max_index]
  swap_index = min_index 
  examined_index = min_index

  while examined_index < max_index
    if array[examined_index] < pivot 
      array[examined_index],array[swap_index] = array[swap_index],array[examined_index]
      swap_index +=1
    end
    examined_index += 1
  end

  #Dropping the pivot at the location of the swap_index
  array[swap_index], array[max_index] = array[max_index], array[swap_index]
  swap_index
end


#Tests
# puts partition([12,5],0,1)
# puts partition([5,12],0,1)
# puts partition([5,5,8,2,8,7],0,5)

#Quicksort Tests
puts "Testing Quicksort:"
test_array = [9,3,6,4,2,100,431,8,12]
quick_sort(test_array,0,8)
puts test_array
