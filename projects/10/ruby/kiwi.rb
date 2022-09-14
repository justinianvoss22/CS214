#### kiwi.rb provides a Kiwi "class".
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


end