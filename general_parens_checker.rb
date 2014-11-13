require 'pry'

#The hinge of this problem is that we can't merely count the number of ({[ brackets.  Otherwise,
#we might end up in a situaiton where )( would be considered balanced but it clearly is not.
#More importantly, when we encounter a closing bracket, we need to consider whether it is matched
#with an opening bracket of the same type.  If it is not, we can return that the array is not balanced

#Great YouTube video: https://www.youtube.com/watch?v=QZOLb0xHB_Q

def parens_checker(string)
  stack = [] 
  string.each_char do |char|
    if char == "{" || char == "(" || char == "["
      stack.push(char)
    else
      character_under_investigation = char
      if matching_paren?(character_under_investigation,stack) == true
        stack.pop 
      else
        return false
      end
    end
  end
  puts stack.empty?
  stack.empty?
end

def matching_paren?(character_under_investigation,stack)
  case character_under_investigation
  when "}"
    stack.last == '{' 
  when ")"
    stack.last == '('
  when "]"
    stack.last == '[' 
  end

end

parens_checker("()")
parens_checker("())")
parens_checker("(())")
parens_checker("[(())]")
parens_checker("(())")
parens_checker("{(())")



#The hinge of this problem is that we can't merely count the number of ({[ brackets.  Otherwise,
#we might end up in a situaiton where )( would be considered balanced but it clearly is not.
#More importantly, when we encounter a closing bracket, we need to consider whether it is matched
#with an opening bracket of the same type.  If it is not, we can return that the array is not balanced