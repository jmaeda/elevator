require './building.rb'
require './person.rb'
require './floor.rb'
require './elevator.rb'

class Simulation

	attr_reader :building

	def initialize(elevators, floors)
		@building = Building.new(:number_of_elevators => elevators, :number_of_floors => floors)
		@building.prepare_environment
	end

	def add_person(current, intended)
		building.add_new_person(current, intended)
	end

	def add_custom_elevator(current_floor, resting_floor)
		building.add_new_elevator(current_floor, resting_floor)
	end

	def run(ticks)
		building.to_s
		(1..ticks).each do
			tick
		end
	end 

	def tick
		elevators = building.get_elevators

		elevators.each do |elevator|
			if elevator.passenger_count == 0
				no_person_condition(elevator)
			else
				many_people_condition(elevator)
			end
		end

		building.to_s
	end

	###General Elevator Methods (regardless of empty or not) ###
	############################################################

	def get_elev_floor_obj(elevator)
		current_position = elevator.get_floor
		floor = building.get_floors[current_position - 1]
		return floor
	end

	def add_all(elevator,floor)
		while floor.empty == false
			elevator.get_on(floor.remove_person)
		end
	end

	############ Empty Elevator #################
	#############################################
	def no_person_condition(elevator)
		if building.waiting
			operation_pickup(elevator)
		elsif elevator.get_floor > elevator.get_resting_floor
			elevator.go_down
		elsif elevator.get_floor < elevator.get_resting_floor
			elevator.go_up
		else
			puts "Elev#{elevator.get_id} Finished "
		end
	end

	def operation_pickup(elevator)
		floor = get_elev_floor_obj(elevator)

		if floor.empty
			search(elevator, building.get_floors, elevator.get_floor)
		else 
			add_to_elevator(elevator, floor, elevator.get_floor)
		end
	end

	def search(elevator, floors, current_position)
		closest_filled = find_closest_filled(floors, current_position)
		
		if current_position - closest_filled > 0
			elevator.go_down
		else
			elevator.go_up
		end
		return closest_filled
	end

	def find_closest_filled(floors, current_position)
		closest_filled = 0
		distance = floors.length

		floors.each do |floor|
			if floor.empty == false
				temp = (current_position - floor.get_position).abs
				if temp < distance
					closest_filled = floor.get_position
				end
			end
		end
		return closest_filled
	end

	def add_to_elevator(elevator, floor, current_position)
		add_all(elevator, floor)

		if elevator.get_people_list[0].get_intended_floor > current_position
			elevator.set_direction(1)
		else
			elevator.set_direction(-1)
		end
	end

	############ Occupied Elevator #################
	################################################
	def many_people_condition(elevator)
		floor = get_elev_floor_obj(elevator)

		if floor.empty && !elevator.drop_off?
			elevator.move
		elsif floor.empty && elevator.drop_off?
			remove_arrived(elevator, floor)
			elevator.check_direction
		else
			remove_arrived(elevator, floor)
			add_all(elevator, floor)
			elevator.check_direction
		end
	end

	def remove_arrived(elevator, floor)
		check = elevator.get_people_list
		check.each do |person|
			if(person.get_intended_floor == floor.get_position)
				elevator.get_off(person)
				floor.add_arrived
			end
		end
	end
end
