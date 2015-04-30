require './simulation.rb'

test1 = Simulation.new(1,5)
test1.add_custom_elevator(5,5)
test1.add_person(1,5)
test1.add_person(1,3)
test1.add_person(3,5)
test1.add_person(4,1)
test1.add_person(2,1)
test1.run(13)

#test1 = Simulation.new(1,5)
#test1.add_person(1,2)
#test1.add_person(1,4)
#test1.add_person(3,4)
#test1.add_person(4,2)
#test1.run(13)