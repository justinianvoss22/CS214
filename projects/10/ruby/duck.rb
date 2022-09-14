#### duck.rb provides a Duck "class".
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


end