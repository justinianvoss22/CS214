# Owl.rb | Defines the Owl class which inherits attributes and methods
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

end