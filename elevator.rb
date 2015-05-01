class Elevator

	attr_reader :id, :current_floor, :direction, :people_list, :resting_floor

	def initialize(id)
		@id = id + 1
		@current_floor = 1
		@direction = 0
		@people_list = Array.new
		@resting_floor = 1
	end

	############## People Interaction #################
	def get_on(person)
		@people_list.push(person)
	end

	def get_off(person)
		@people_list.delete(person)
	end

	############## Get State #################
	def get_id
		return id
	end

	def get_resting_floor
		return resting_floor
	end

	def get_people_list
		return people_list
	end

	def passenger_count
		return people_list.length
	end

	def get_floor
		return current_floor
	end

	def drop_off?
		check = false
		people_list.each do |person|
			if current_floor == person.get_intended_floor
				check = true
			end
		end
		return check
	end

	############## Basic Change Attributes #################
	def set_direction(value)
		@direction = value
	end

	def set_current_floor(value)
		@current_floor = value
	end

	def set_resting_floor(value)
		@resting_floor = value
	end

	def check_direction
		if direction == 1
			still_rising?
		elsif direction == -1
			still_falling?
		else
			puts "Error"
		end
	end
	############## Floor Modification #################
	def go_down
		@current_floor = @current_floor - 1
	end

	def go_up
		@current_floor = @current_floor + 1
	end

	def move
		if(direction == 1)
			go_up
		elsif(direction == -1)
			go_down
		else
			"Incorrect Move Call"
		end
	end

	############## Direction Modification #################
	def still_rising?
		set_direction(-1)
		people_list.each do |person|
			if current_floor < person.get_intended_floor
				set_direction(1)
			end
		end
	end

	def still_falling?
		set_direction(1)
		people_list.each do |person|
			if current_floor > person.get_intended_floor
				set_direction(-1)
			end
		end
	end

	############## Print Elevator #################
	def to_s
		print " < Elev#{id}(#{passenger_count}) floor:#{current_floor} > "
	end
end