Script started on 2022-03-24 15:39:07-04:00 [TERM="xterm-256color" TTY="/dev/pts/2" COLUMNS="119" LINES="24"]
]0;jav86@gold29: ~/CS214/projects/10/ruby[01;32mjav86@gold29[00m:[01;34m~/CS214/projects/10/ruby[00m$ cat birds.rb Bird.rb WalkingBird.rb FlyingBird.rb kiwi.rb ostrih.   ch  ich.rb penu guin.rb  duck.rb goose.rb owl.rb
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
require './ostrich.rb'
require './penguin.rb'
require './kiwi.rb'
require './FlyingBird.rb'
require './WalkingBird.rb'

puts "\nWelcome to the Bird Park!\n\n"

bird0 = Bird.new "Hawkeye"
bird0.print

bird1 = Duck.new "Donald"
bird1.print

bird2 = Goose.new "Mother"
bird2.print

bird3 = Owl.new "Woodsey"
bird3.print

bird4 = Ostrich.new "Ozzie"
bird4.print

bird5 = Penguin.new "Pingu"
bird5.print

bird6 = Kiwi.new "Ninja"
bird6.print

puts "\n\n"
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

      def movement
        'ran'
      end
    
      def print
        puts name + + ' ' + className + ' ' + movement + " and said " + call
      end
  end
  #### WalkingBird.rb provides a Duck "class".
#### 
#### Begun by: Prof. Adams, for CS 214 at Calvin College.
## Completed by: Justin Voss
## Date: 03/24/22
#########################################################
require './Bird.rb'
class WalkingBird < Bird
    def movement
        'walked'
      end

end#### FlyingBird.rb provides a Duck "class".
#### 
#### Begun by: Prof. Adams, for CS 214 at Calvin College.
## Completed by: Justin Voss
## Date: 03/24/22
#########################################################
require './Bird.rb'
class FlyingBird < Bird
    def movement
        'flew'
      end

end#### kiwi.rb provides a Kiwi "class".
#### 
#### Begun by: Prof. Adams, for CS 214 at Calvin College.
## Completed by: Justin Voss
## Date: 03/24/22
#########################################################
require './Bird.rb'
require './WalkingBird.rb'
class Kiwi < WalkingBird
    def call
        'KIII! KIII!'
      end


end#### ostrich.rb provides a Ostrich "class".
#### 
#### Begun by: Prof. Adams, for CS 214 at Calvin College.
## Completed by: Justin Voss
## Date: 03/24/22
#########################################################
require './Bird.rb'
require './WalkingBird.rb'
class Ostrich < WalkingBird
    def call
        'WAHHHHH!'
      end


end#### penguin.rb provides a Penguin "class".
#### 
#### Begun by: Prof. Adams, for CS 214 at Calvin College.
## Completed by: Justin Voss
## Date: 03/24/22
#########################################################
require './Bird.rb'
require './WalkingBird.rb'
class Penguin < WalkingBird
    def call
        'NOOT NOOT!'
      end
end#### duck.rb provides a Duck "class".
#### 
#### Begun by: Prof. Adams, for CS 214 at Calvin College.
## Completed by: Justin Voss
## Date: 03/24/22
#########################################################
require './Bird.rb'
require './FlyingBird.rb'
class Duck < FlyingBird
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
require './FlyingBird.rb'
class Goose < FlyingBird
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
require './FlyingBird.rb'
class Owl < FlyingBird
    def call
        'Hoo! Hoo!'
      end

end]0;jav86@gold29: ~/CS214/projects/10/ruby[01;32mjav86@gold29[00m:[01;34m~/CS214/projects/10/ruby[00m$ [Kruby birds.rb

Welcome to the Bird Park!

Hawkeye Bird ran and said Squaaaaaaawk!
Donald Duck flew and said QUAAAACK!
Mother Goose flew and said Honk! Honk!
Woodsey Owl flew and said Hoo! Hoo!
Ozzie Ostrich walked and said WAHHHHH!
Pingu Penguin walked and said NOOT NOOT!
Ninja Kiwi walked and said KIII! KIII!


]0;jav86@gold29: ~/CS214/projects/10/ruby[01;32mjav86@gold29[00m:[01;34m~/CS214/projects/10/ruby[00m$ exit

Script done on 2022-03-24 15:39:49-04:00 [COMMAND_EXIT_CODE="0"]
