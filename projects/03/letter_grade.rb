#! /usr/bin/ruby
# letter_grade.rb translates a score into a grade
# Completed by Justin Voss, 1/28/22
################################################################

# Input:  A score
# Precondition: The score is an integer
# Output: The corresponding letter grade

#  Replace this line with the definition of function yearCode() 
def letterGrade(score)
   case (score/10)
   when 10
        "A"
   when 9
        "A"
   when 8
        "B"
   when 7
        "C"
   when 6
        "D"
   else 
        "F"
 end 
end 

 
 if __FILE__ == $0
    print "Enter the score: "
    score = gets.chomp.to_i  #turns the input into an integer
    print "Grade is: "
    puts letterGrade(score)
 end