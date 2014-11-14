def check_palindrome(string)
  stack = string.split('')
  length = stack.length
  new_stack = []

  length.times do 
    new_stack.push(stack.pop)
  end

  puts "string = #{string}, and new_stack = #{new_stack}"
  string == new_stack.join
end

puts check_palindrome("deed")    #=> true
puts check_palindrome("radar")   #=> true
puts check_palindrome("sports")  #=> false