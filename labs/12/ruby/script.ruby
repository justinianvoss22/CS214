Script started on 2022-04-08 12:37:37-04:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="80" LINES="24"]
]0;jav86@gold11: ~/CS214/labs/12/ruby[01;32mjav86@gold11[00m:[01;34m~/CS214/labs/12/ruby[00m$ cat threaded_array+sum    _syum   um.rb
# array_sum.rb sums the values in an array
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: Justin Voss
# Date: 04/07/22
#
# Usage: ruby array_sum.rb <inFileName>
######################################################

# make certain the input file was specified on the command-line
def checkCommandLine
   if ARGV.length != 2
      puts "\nUsage: sum <inFileName> <numThreads>\n\n"
      exit(1)
   end
end




# return: an array containing the values from the file
#  whose name was specified on the command-line
def readFile
   strArray = IO.readlines( ARGV[0] )
   intArray = Array.new( Integer(strArray[0]) )
   for i in 2..strArray.size
      if  !strArray[i].nil?
         intArray[i-2] = Integer( strArray[i].chomp )
      end
   end
   intArray 
end

def sumSlice(values, id, sliceSize)
   start = id * sliceSize
   stop = start + sliceSize - 1
   myTotal = 0
   for i in start..stop
      myTotal += values[i]
   end
   myTotal
end

def sumInParallel(values, numThreads)
   sliceSize = values.size / numThreads
   threadArray = Array.new( numThreads )
   result = 0
   lock = Mutex.new

   (1..numThreads-1).each do | i |
       threadArray[i] = Thread.new { 
                         myTotal = sumSlice(values, 
                                              i,
                                              sliceSize) 
                         lock.synchronize {
                             result += myTotal
                         }
       }
   end

   myTotal  = sumSlice(values, 0, sliceSize)

   leftovers = values.size % numThreads
   if leftovers > 0
      for i in values.size-leftovers..values.size-1
         myTotal += values[i]
      end
   end

   lock.synchronize {
      result += myTotal
   }

   for i in 1..numThreads-1
      threadArray[i].join
   end

   result
end


def main
   checkCommandLine
   values = readFile
   startTime = Time.now
   total = sumInParallel(values, Integer( ARGV[1] ) )
   endTime = Time.now
   interval = (endTime - startTime).to_f
   puts "\nThe sum is #{total}\n"
   printf(" and computing it took %.9f seconds.\n\n", interval)
end

main

]0;jav86@gold11: ~/CS214/labs/12/ruby[01;32mjav86@gold11[00m:[01;34m~/CS214/labs/12/ruby[00m$ ruby    cat threaded_array_sum.rbruby threaded_array_sum.rb  /home/cs/214/labs//12/numbers/5numbers.txt 5 1[1P[1@1[1@0[1@0[1@0[1@0[1@0[1@0numbers.txt 1

The sum is 50473230
 and computing it took 0.024545736 seconds.

]0;jav86@gold11: ~/CS214/labs/12/ruby[01;32mjav86@gold11[00m:[01;34m~/CS214/labs/12/ruby[00m$ [Kruby threaded_array_sum.rb  /home/cs/214/labs//12/numbers/1000000numbers.txt 11 4

The sum is 50473230
 and computing it took 0.025299943 seconds.

]0;jav86@gold11: ~/CS214/labs/12/ruby[01;32mjav86@gold11[00m:[01;34m~/CS214/labs/12/ruby[00m$ [Kexit

Script done on 2022-04-08 12:38:58-04:00 [COMMAND_EXIT_CODE="0"]
