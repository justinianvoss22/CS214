# Name.rb holds class Name and its operations
#
# Completed by: Justin Voss
# Date: 3/17/22
####################################################
module Names
    class Name

        def initialize(first, middle, last)
        @first, @middle, @last = first, middle, last
        end
    
        attr_reader :first, :middle, :last
    
        def fullName
        @first + " " + @middle + " " + @last
        end
    
        def print
        puts fullName
        fullName
        end
    end
end