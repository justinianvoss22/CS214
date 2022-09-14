# quad_roots.rb computes the roots of a quadratic equation
#
# Input:
# Precondition: 
# Output: The roots from the values given for a quadratic equation
#
# Completed by: Justin Voss
# Date: 2/17/22
#################################################################


# quadratic_roots computes the roots of a quadratic equation
# Receive: numbers a,b, and c                    
# Return: An array, roots, with the values of root1 and root2
######################################################
def quadratic_roots(a, b, c)
    if a != 0
        arg = (b**2.0) - (4 * a * c);
        if arg >= 0
            root1 = (-b + Math.sqrt(arg)) / (2*a);
            root2 = (-b - Math.sqrt(arg)) / (2*a);
        else
            puts "\n*** quadraticRoots(): b^2 - 4ac is negative!"
            root1 = root2 = 0.0;
        end
    else
        puts ("\n*** QuadraticRoots(): a is zero!");
        root = root2 = 0.0;
    end 
    roots = [root1, root2] # adds the roots to an array called roots
    return roots 

end

# Driver program, which prints out the roots
if __FILE__ == $0
    print "Enter a:"
    a = gets.to_f # gets input value
    print "Enter b:"
    b = gets.to_f # gets input value
    print "Enter c:"
    c = gets.to_f # gets input value
    roots = quadratic_roots(a, b, c);
    if roots[0] != 0 && roots[1] != 0 # Only prints the roots if they are valid
        puts "The roots are #{ roots[0] } and #{ roots[1] }" # prints out the statement
    end
end