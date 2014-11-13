def bubble_sort(array)
#Compare the first two array elements
#If element one is greater than element two, swap
#Compare the next two elements of the array
#Stop when no swaps have occurred

num_iterations = array.size - 1
swapped = true 

while swapped == true do
  counter = 0
  swapped = false
  num_iterations.times do
    if array[counter] > array[counter+1]
      array[counter],array[counter+1] = array[counter+1],array[counter]
      swapped = true
    end
    counter += 1
  end
end

array 

end


bubble_sort ([3,5,1, 19, 3, 2, 7])
