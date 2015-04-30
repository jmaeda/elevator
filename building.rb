require './person.rb'
require './floor.rb'
require './elevator.rb'

class Building

	attr_reader :number_of_elevators, :number_of_floors, :floor_list, :elevator_list

	def initialize(args)
		@number_of_elevators = args[:number_of_elevators] || 1
		@number_of_floors = args[:number_of_floors] || 1
		@floor_list = Array.new()
		@elevator_list = Array.new()
	end

	########## Environment Setup #############
	##########################################
	def prepare_environment
		create_floors
		create_elevators
	end

	def create_floors
		@floor_list.clear

		(1..(number_of_floors)).each do |floor|
			@floor_list.push(Floor.new(:position => floor))
		end
	end

	def create_elevators
		@elevator_list.clear

		(0..(number_of_elevators - 1)).each do |elevator|
			@elevator_list.push(Elevator.new(elevator))
		end
	end

	def add_new_person(floor, intended_floor)
		a_person = Person.new(intended_floor)
		@floor_list[floor - 1].add_person(a_person)
	end

	def add_new_elevator(current_floor, resting_floor)
		custom_elevator = Elevator.new(elevator_list.length)
		custom_elevator.set_current_floor(current_floor)
		custom_elevator.set_resting_floor(resting_floor)
		@elevator_list.push(custom_elevator)
	end

	############ Return Values ###############
	##########################################
	def get_elevators
		return elevator_list
	end

	def get_floors
		return floor_list
	end

	#determines if people are waiting for an elevator or not
	def waiting
		waiting = 0

		floor_list.each do |floor|
			waiting = waiting + floor.people_waiting
		end

		if waiting > 0
			return true
		else
			return false
		end
	end


	########## Printing a Building ############
	###########################################
	#prints the floors with people and elevators
	def to_s
		puts "Building:"
		floor_separation
		floor_list.reverse_each do |floor|
			floor.to_s
			elevator_print(floor)
			floor_separation
		end
		puts
		puts
	end

	#prints somewhat literal floor of building
	def floor_separation
		print "|"
		print "-" * 40
		puts "|"
	end	

	#prints elevators at the correct floors
	def elevator_print(floor)
		elevator_list.each do |elevator|
			if(floor.get_position == elevator.get_floor)
				elevator.to_s
			end
		end
		puts
	end
end
