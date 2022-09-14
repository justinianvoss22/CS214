Script started on 2022-02-04 14:34:41-05:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="90" LINES="24"]
]0;jav86@gold18: ~/CS214/projects/04[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/04[00m$ f cat s factorial.rb
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
end]0;jav86@gold18: ~/CS214/projects/04[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/04[00m$ ruby c factorial.rb
To compute n!, enter n: 2
 2.0 ! =  2
]0;jav86@gold18: ~/CS214/projects/04[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/04[00m$ ruby factorial.rb
To compute n!, enter n: 3
 3.0 ! =  6
]0;jav86@gold18: ~/CS214/projects/04[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/04[00m$ ruby factorial.rb
To compute n!, enter n: 4
 4.0 ! =  24
]0;jav86@gold18: ~/CS214/projects/04[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/04[00m$ ruby factorial.rb
To compute n!, enter n: 5
 5.0 ! =  120
]0;jav86@gold18: ~/CS214/projects/04[01;32mjav86@gold18[00m:[01;34m~/CS214/projects/04[00m$ exit
exit

Script done on 2022-02-04 14:35:13-05:00 [COMMAND_EXIT_CODE="0"]
