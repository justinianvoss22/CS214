#! /usr/bin/ruby
# factorial.rb computes the factorial of a number
#

# Completed by: Justin Voss, 2/4/22
#
# Input:  an integer, n
# Precondition: the number n is an integer
# Output: The factorial of a number, printed out to the console


# Computes factorial
 def factorial(n)
    answer = 1;
    i = 2;
    # for loop
    for  i in 2..n do
       answer = i * answer 
    end
    return answer.to_s
end


if __FILE__ == $0
    print "To compute n!, enter n: "
    n = gets.to_f # gets input value
    puts " #{ n } ! =  #{factorial(n)}" # prints out the statement
end