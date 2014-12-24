#Find the midpoint between the min and max
#Create two new min,max values
#Is the value of the middle element less than or greater than the element we're searching for
#If it's smaller, perform binary search on this smaller array, adjust min and max
#If it's larger, perform binary search on this smaller array, adjust min and max

#If there are two elements left in the comparison
#Compare both

def binary_search(array,item,min,max) #We want this to return the array index of item
  midpoint = min + ( (max - min) / 2 )
  return midpoint if array[midpoint] == item

  if max - min == 1 || max - min == 0
    if array[midpoint] == item
      return midpoint
    elsif array[midpoint +1] == item
      return midpoint + 1
    else
      return nil
    end
  end


  if array[midpoint] > item
    binary_search(array,item,min,midpoint)
  else array[midpoint] < item
    binary_search(array,item,midpoint,max)
  end

end

#If an array does not have a midpoint, round down
def find_middle_array_element(array)

  return 0 if array.size == 1 
  if array.size.odd?
    array.size/2
  elsif array.size.even? 
    (array.size/2) - 1
  end

end

