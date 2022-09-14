#### ostrich.rb provides a Ostrich "class".
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


end