# def average_of_three(num1, num2, num3)
# 	return (num1 + num2 + num3)/3.0
# end
#
# puts average_of_three(3, 7, 8)   # => 6.0
# puts average_of_three(2, 5, 17)  # => 8.0
# puts average_of_three(2, 8, 1)   # => 3.666666
#-------------------------------------------------------------
# CONDITIONALS SYNTAX
#num = 41

# if num > 0
#   puts "positive"
# else if num < 0   #(can also do elsif)
#   puts "negative"
# else
#   puts "zero!"
# end
#---------------------------------------------------------------
#LOOPS BREAKS AND NEXTS
#break ends the loop, next goes to the next step in the loop
# i.e.
#
# i = 1
# while i <= 10
#   puts i
#   if i == 5
#     i += 1
#     next
#   end
#   puts i
#   i += 1
# ends
#
# This will print 1,1,2,2...,4,4,5,6,6
#---------------------------------------------------------------
#ARRAY CONCATENATION/SHOVELLING
#nums = [1, 1, 2, 3, 5]
#nums << 8
#nums << 13
#nums == [1, 1, 2, 3, 5, 8, 13]
#--------------------------------------------------------------
#MORE ARRAY/STRING METHODS

#nums.push(21) also adds at the end of the array, but can do nums.push(22, 35, 57)
  #RETURNS THE ARRAY WITH THE NEW ELEMENT
#nums.pop() remove the last element in the array, can also just do nums.pop
  #RETURNS THE ELEMENT THAT IT REMOVES
#nums.unshift(21) adds the element at the beginning of the ARRAY
  #RETURNS THE ARRAY WITH THE NEW element
#nums.shift removes the first element in the ARRAY
  #RETURNS THE ELEMENT THAT IT REMOVES

#nums.index(21) will return the index # at which 21 is in either array or string
  #returns nothing if value is not found in the array/string
#nums.include?(21) will return boolean of whether or not array/string contains 21
  #? usually means that you will be returning a boolean

#arr.reverse returns an array that reverses the original but doesn't change the original
#arr.reverse! actually changes the original array & returns the reversed array
  #! usually means that you will be changing the original item

#arr[num1..num2] returns an array of elements from arr[num1] to arr[num2], inclusive
#arr[num1...num2] returns an array of elements from arr[num1] to arr[num2], excluding arr[num2]
  #can use negative indicies with this method

#str.split(char/substring) returns an array made up of the string split at each appearance of char(STRING ONLY)
  #THIS REMOVES EVERY OCCURANCE OF char, i.e. "hello world".split(" ") => ["hello","world"]
  #Splitting on double occurances will result in an array element "" and an extra "" for each following occurance
#arr.join(char/substring) returns a string made up of each element of the array joined by char (ARRAY ONLY)
  #["Hi","everybody"].join(" ") => "Hi everybody"
#can do str.split(char).join(char2) to replace every char in str with char2

str = "Follllow the yellllow brick road"
print str.split("l") 
# this returns ["Fo", "", "", "", "ow the ye", "", "", "", "ow brick road"]
print str.split("l").join("x")
#----------------------------------------------------------------
#ANY METHOD THAT ENDS IN (), NO ARGUMENTS, CAN OMIT THE () i.e. ARR.pop
#----------------------------------------------------------------
