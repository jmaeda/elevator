require './simulation.rb'

test1 = Simulation.new(1,5)     #new environment with 1 elevator 5 floors
test1.add_custom_elevator(5,5)  #adds new custom elevator (so 2 in total) which starts and rests on floor 5
test1.add_person(1,5)			#adds person on 1st floor trying to get to 5th floor	
test1.add_person(1,3)			#adds person on 1st floor trying to get to 3rd floor
test1.add_person(3,4)			#adds person on 3rd floor trying to get to 4th floor
test1.add_person(4,1)			#adds person on 4th floor trying to get to 1st floor
test1.add_person(2,1)			#adds person on 2nd floor trying to get to 1st floor
test1.run(14)					#runs for 14 ticks
