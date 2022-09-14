Script started on 2022-03-24 13:16:22-04:00 [TERM="xterm-256color" TTY="/dev/pts/0" COLUMNS="80" LINES="24"]
]0;jav86@gold29: ~/CS214/labs/10/ruby[01;32mjav86@gold29[00m:[01;34m~/CS214/labs/10/ruby[00m$ cat Bird.rb duck    birds.rb duck.rb goose.rb owl.rb

# Bird.rb | Defines a Bird superclass 
#   to be extended by specific bird sub-classes.
#### Begun by: Prof. Adams, for CS 214 at Calvin College.
## Completed by: Justin Voss
## Date: 03/24/22
#########################################################

class Bird

    attr_reader :name
  
    def initialize(name)
      @name = name
    end
  
    def call
        'Squaaaaaaawk!'
      end
    
      def className
        self.class.to_s
      end
    
      def print
        puts name + className + " says " + call
      end
  end
  # birds.rb | Tests out the menagerie of bird classes.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
## Completed by: Justin Voss
## Date: 03/24/22
######################################################

require './Bird.rb'
require './duck.rb'
require './goose.rb'
require './owl.rb'

puts "\nWelcome to the Bird Park!\n\n"

bird0 = Bird.new "Hawkeye"
bird0.print

bird1 = Duck.new "Donald"
bird1.print

bird2 = Goose.new "Mother"
bird2.print

bird3 = Owl.new "Woodsey"
bird3.print

puts "\n\n"#### duck.rb provides a Duck "class".
#### 
#### Begun by: Prof. Adams, for CS 214 at Calvin College.
## Completed by: Justin Voss
## Date: 03/24/22
#########################################################
require './Bird.rb'
class Duck < Bird
    def call
        'QUAAAACK!'
      end


end#### goose.rb provides a Goose "class".
#### 
#### Begun by: Prof. Adams, for CS 214 at Calvin College.
## Completed by: Justin Voss
## Date: 03/24/22
#########################################################
require './Bird.rb'
class Goose < Bird
    def call
        'Honk! Honk!'
      end


end# Owl.rb | Defines the Owl class which inherits attributes and methods
#   from the Bird superclass.
#### Begun by: Prof. Adams, for CS 214 at Calvin College.
## Completed by: Justin Voss
## Date: 03/24/22
#########################################################

require './Bird.rb'

class Owl < Bird
    def call
        'Hoo! Hoo!'
      end

end]0;jav86@gold29: ~/CS214/labs/10/ruby[01;32mjav86@gold29[00m:[01;34m~/CS214/labs/10/ruby[00m$ r ruby Bird    birds.rb

Welcome to the Bird Park!

HawkeyeBird says Squaaaaaaawk!
DonaldDuck says QUAAAACK!
MotherGoose says Honk! Honk!
WoodseyOwl says Hoo! Hoo!


]0;jav86@gold29: ~/CS214/labs/10/ruby[01;32mjav86@gold29[00m:[01;34m~/CS214/labs/10/ruby[00m$ exit

Script done on 2022-03-24 13:16:57-04:00 [COMMAND_EXIT_CODE="0"]
