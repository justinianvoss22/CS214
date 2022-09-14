#### goose.rb provides a Goose "class".
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


end