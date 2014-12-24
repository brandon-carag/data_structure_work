require_relative "binary_search"
require "minitest/autorun"
require 'pry'

class Test_Class < MiniTest::Unit::TestCase

  def test_finds_middle_element
    assert_equal(0,find_middle_array_element([1]) )
    assert_equal(1,find_middle_array_element([1,2,3]) )  #even
    assert_equal(1,find_middle_array_element([1,2,3,4]) ) #odd
  end

  def test_binary_search
    assert_equal(0,binary_search([3],3,0,0) )
    assert_equal(nil,binary_search([3],1000,0,0) )
    assert_equal(3, binary_search([1,3,5,7,9], 7, 0, 4) )
    assert_equal(0, binary_search([1,3,5,7,9], 1, 0, 4) )
    assert_equal(6, binary_search([1,2,3,5,7,9,100], 100, 0, 6) ) 
    assert_equal(nil, binary_search([1,2,3,5,7,9,100], 99, 0, 6) ) 
  end

end