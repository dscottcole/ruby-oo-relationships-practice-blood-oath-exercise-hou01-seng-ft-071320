require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

water = Cult.new("Water", "Ocean", 0, "Always wet")
earth = Cult.new("Earth", "Everest", 1, "Always hard")
wind = Cult.new("Wind", "Sky", 0, "I blow")
fire = Cult.new("Fire", "Hot Places", 3, "You shall burn")
ghost = Cult.new("Ghost", "Sky", 4, "Boo")

jimmy = Follower.new("Jimmy", 18, "Life sucks")
tommy = Follower.new("Tommy", 21, "Life is great")
johnny = Follower.new("Johnny", 35, "Life is mediocre")
timmy = Follower.new("Timmy", 15, "Life is AWESOME")
james = Follower.new("James", 1000, "Nobody can see me")

water.recruit_follower(jimmy)
water.recruit_follower(tommy)
earth.recruit_follower(johnny)
wind.recruit_follower(timmy)
ghost.recruit_follower(james)
fire.recruit_follower(jimmy)
jimmy.join_cult(earth)



binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits