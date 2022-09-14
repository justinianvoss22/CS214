Script started on 2022-03-19 20:05:37-04:00 [TERM="xterm-256color" TTY="/dev/pts/1" COLUMNS="105" LINES="30"]
]0;jav86@gold29: ~/CS214/projects/09/ruby[01;32mjav86@gold29[00m:[01;34m~/CS214/projects/09/ruby[00m$ cat Tempr erature.rb TemperatureTester.rb
# Temperature.rb holds class Temperature and its operations
#
# Completed by: Justin Voss
# Date: 3/17/22
####################################################
module Temperatures
    class Temperature

        def initialize(myDegrees, myScale)
            if checkValid(myDegrees, myScale)
                @myDegrees, @myScale = myDegrees, myScale.upcase
            else puts "Error. Invalid scale."
            end

                
        end
    
        attr_accessor :myDegrees, :myScale
        
        def toFahrenheit()
            if @myScale == 'C'
                return Temperature.new((@myDegrees * (9.0 /5.0)) + 32.0, 'F')
            elsif @myScale == 'K' 
                return Temperature.new((@myDegrees - 273.15) * (9.0 /5.0) + 32, 'F')
            else 
                return Temperature.new(@myDegrees, @myScale)
            end
        end

        def toCelsius()
            if @myScale == 'F'
                return Temperature.new((@myDegrees - 32) * (5.0/9.0), 'C')
            elsif @myScale == 'K' 
                return Temperature.new((@myDegrees - 273.15), 'C')
            else 
                return Temperature.new(@myDegrees, @myScale)
            end
        end 

        def toKelvin()
            if @myScale == 'F'
                return Temperature.new((@myDegrees - 32) * (5.0/9.0) + 273.15, 'K')
            elsif @myScale == 'C' 
                return Temperature.new((@myDegrees + 273.15), 'K')
            else 
                return Temperature.new(@myDegrees, @myScale)
            end
        end 

        def readTemperature()
            puts "Enter a degree and scale with space in between: "
            input = gets.chomp
            split = input.split(" ")  # splits input into two parts
            @myDegrees = split[0].to_f
            @myScale = split[1]
        end


        def printTemperature
            print "#{'%.2f' % @myDegrees} #{@myScale.upcase} \t"
        end
    

        def raise(moreDegrees)
            return Temperature.new(@myDegrees + moreDegrees, @myScale)
        end


        def lower(moreDegrees)
            return Temperature.new(@myDegrees - moreDegrees, @myScale)
        end

        def equals(temp1, temp2)
            if temp1.myScale == temp2.myScale
                return (temp1.myDegrees == temp2.myDegrees)
            else
                return ((temp1.toFahrenheit.myDegrees == temp2.toFahrenheit.myDegrees))  # if not same scale, converts it to same scale
            end
        end

        def lessThan(temp1, temp2)
            if temp1.myScale == temp2.myScale
                return (temp1.myDegrees < temp2.myDegrees)
            else
                return ((temp1.toFahrenheit.myDegrees < temp2.toFahrenheit.myDegrees))  # if not same scale, converts it to same scale
            end
        end

        def makeTable(baseTemp, limitTemp, stepValue)
            base = baseTemp
            limit = limitTemp
            step = stepValue
            if (checkValid(baseTemp.myDegrees, baseTemp.myScale) && checkValid(limitTemp.myDegrees, limitTemp.myScale))  # checks for valid temp
            if base.lessThan(base, limit)
                while (base.lessThan(base,limit)) do  # loops to make table
                    base.toFahrenheit().printTemperature()
                    base.toCelsius().printTemperature()
                    base.toKelvin().printTemperature()
                    puts "\n"
                    base = base.raise(stepValue)
                end
                else 
                    puts "Error: base temp has to be greater than limit temp."
               end
            else puts "\nError:Invalid scale.\n"
            end
        end

        def checkValid(degrees, scale)
            upperCase = scale.upcase
            return (upperCase == 'F' && degrees >= -459.67)  || (upperCase == 'C' && degrees >= -273.15) || (upperCase == 'K' && degrees >= 0.0)
        end
     




  



    end
end# aTempTester.rb tests class Temperature and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Justin Voss
# Date: 3/17/22
####################################################

require 'test/unit/assertions'
include Test::Unit::Assertions

#require './Temperature'
load './Temperature.rb' # used load to load a program



def testTemperature
        # referenced the Temperatures module
        aTemp = Temperatures::Temperature.new(32.0, 'F') 
        aTemp2 = Temperatures::Temperature.new(0.0, 'C') 
        aTemp3 = Temperatures::Temperature.new(273.15, 'K')

        baseTemp = Temperatures::Temperature.new(0.0, 'F')
        limitTemp = Temperatures::Temperature.new(0.0, 'F')

        assert aTemp.myDegrees == 32.0, 
                "first failed"
        assert aTemp.myScale == 'F',
                "middle failed"
        
        print "All tests passed!\n"

        baseTemp.readTemperature
        limitTemp.readTemperature
        puts "Enter a step value: "
        stepValue = gets.chomp.to_f
        
        baseTemp.makeTable(baseTemp,limitTemp,stepValue) # makes the table
end

testTemperature]0;jav86@gold29: ~/CS214/projects/09/ruby[01;32mjav86@gold29[00m:[01;34m~/CS214/projects/09/ruby[00m$ ruby TemperatureTester.rb
All tests passed!
Enter a degree and scale with space in between: 
0 F
Enter a degree and scale with space in between: 
100 C
Enter a step value: 
2.5
0.00 F 	-17.78 C 	255.37 K 	
2.50 F 	-16.39 C 	256.76 K 	
5.00 F 	-15.00 C 	258.15 K 	
7.50 F 	-13.61 C 	259.54 K 	
10.00 F 	-12.22 C 	260.93 K 	
12.50 F 	-10.83 C 	262.32 K 	
15.00 F 	-9.44 C 	263.71 K 	
17.50 F 	-8.06 C 	265.09 K 	
20.00 F 	-6.67 C 	266.48 K 	
22.50 F 	-5.28 C 	267.87 K 	
25.00 F 	-3.89 C 	269.26 K 	
27.50 F 	-2.50 C 	270.65 K 	
30.00 F 	-1.11 C 	272.04 K 	
32.50 F 	0.28 C 	273.43 K 	
35.00 F 	1.67 C 	274.82 K 	
37.50 F 	3.06 C 	276.21 K 	
40.00 F 	4.44 C 	277.59 K 	
42.50 F 	5.83 C 	278.98 K 	
45.00 F 	7.22 C 	280.37 K 	
47.50 F 	8.61 C 	281.76 K 	
50.00 F 	10.00 C 	283.15 K 	
52.50 F 	11.39 C 	284.54 K 	
55.00 F 	12.78 C 	285.93 K 	
57.50 F 	14.17 C 	287.32 K 	
60.00 F 	15.56 C 	288.71 K 	
62.50 F 	16.94 C 	290.09 K 	
65.00 F 	18.33 C 	291.48 K 	
67.50 F 	19.72 C 	292.87 K 	
70.00 F 	21.11 C 	294.26 K 	
72.50 F 	22.50 C 	295.65 K 	
75.00 F 	23.89 C 	297.04 K 	
77.50 F 	25.28 C 	298.43 K 	
80.00 F 	26.67 C 	299.82 K 	
82.50 F 	28.06 C 	301.21 K 	
85.00 F 	29.44 C 	302.59 K 	
87.50 F 	30.83 C 	303.98 K 	
90.00 F 	32.22 C 	305.37 K 	
92.50 F 	33.61 C 	306.76 K 	
95.00 F 	35.00 C 	308.15 K 	
97.50 F 	36.39 C 	309.54 K 	
100.00 F 	37.78 C 	310.93 K 	
102.50 F 	39.17 C 	312.32 K 	
105.00 F 	40.56 C 	313.71 K 	
107.50 F 	41.94 C 	315.09 K 	
110.00 F 	43.33 C 	316.48 K 	
112.50 F 	44.72 C 	317.87 K 	
115.00 F 	46.11 C 	319.26 K 	
117.50 F 	47.50 C 	320.65 K 	
120.00 F 	48.89 C 	322.04 K 	
122.50 F 	50.28 C 	323.43 K 	
125.00 F 	51.67 C 	324.82 K 	
127.50 F 	53.06 C 	326.21 K 	
130.00 F 	54.44 C 	327.59 K 	
132.50 F 	55.83 C 	328.98 K 	
135.00 F 	57.22 C 	330.37 K 	
137.50 F 	58.61 C 	331.76 K 	
140.00 F 	60.00 C 	333.15 K 	
142.50 F 	61.39 C 	334.54 K 	
145.00 F 	62.78 C 	335.93 K 	
147.50 F 	64.17 C 	337.32 K 	
150.00 F 	65.56 C 	338.71 K 	
152.50 F 	66.94 C 	340.09 K 	
155.00 F 	68.33 C 	341.48 K 	
157.50 F 	69.72 C 	342.87 K 	
160.00 F 	71.11 C 	344.26 K 	
162.50 F 	72.50 C 	345.65 K 	
165.00 F 	73.89 C 	347.04 K 	
167.50 F 	75.28 C 	348.43 K 	
170.00 F 	76.67 C 	349.82 K 	
172.50 F 	78.06 C 	351.21 K 	
175.00 F 	79.44 C 	352.59 K 	
177.50 F 	80.83 C 	353.98 K 	
180.00 F 	82.22 C 	355.37 K 	
182.50 F 	83.61 C 	356.76 K 	
185.00 F 	85.00 C 	358.15 K 	
187.50 F 	86.39 C 	359.54 K 	
190.00 F 	87.78 C 	360.93 K 	
192.50 F 	89.17 C 	362.32 K 	
195.00 F 	90.56 C 	363.71 K 	
197.50 F 	91.94 C 	365.09 K 	
200.00 F 	93.33 C 	366.48 K 	
202.50 F 	94.72 C 	367.87 K 	
205.00 F 	96.11 C 	369.26 K 	
207.50 F 	97.50 C 	370.65 K 	
210.00 F 	98.89 C 	372.04 K 	
]0;jav86@gold29: ~/CS214/projects/09/ruby[01;32mjav86@gold29[00m:[01;34m~/CS214/projects/09/ruby[00m$ ruby TemperatureTester.rb
All tests passed!
Enter a degree and scale with space in between: 
0 K
Enter a degree and scale with space in between: 
212 F
Enter a step value: 
20.0
-459.67 F 	-273.15 C 	0.00 K 	
-423.67 F 	-253.15 C 	20.00 K 	
-387.67 F 	-233.15 C 	40.00 K 	
-351.67 F 	-213.15 C 	60.00 K 	
-315.67 F 	-193.15 C 	80.00 K 	
-279.67 F 	-173.15 C 	100.00 K 	
-243.67 F 	-153.15 C 	120.00 K 	
-207.67 F 	-133.15 C 	140.00 K 	
-171.67 F 	-113.15 C 	160.00 K 	
-135.67 F 	-93.15 C 	180.00 K 	
-99.67 F 	-73.15 C 	200.00 K 	
-63.67 F 	-53.15 C 	220.00 K 	
-27.67 F 	-33.15 C 	240.00 K 	
8.33 F 	-13.15 C 	260.00 K 	
44.33 F 	6.85 C 	280.00 K 	
80.33 F 	26.85 C 	300.00 K 	
116.33 F 	46.85 C 	320.00 K 	
152.33 F 	66.85 C 	340.00 K 	
188.33 F 	86.85 C 	360.00 K 	
]0;jav86@gold29: ~/CS214/projects/09/ruby[01;32mjav86@gold29[00m:[01;34m~/CS214/projects/09/ruby[00m$ exit

Script done on 2022-03-19 20:06:25-04:00 [COMMAND_EXIT_CODE="0"]
