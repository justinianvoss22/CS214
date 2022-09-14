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