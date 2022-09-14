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
end