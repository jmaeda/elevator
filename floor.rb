class Floor

	attr_reader :position, :person_queue, :arrived

	def initialize(args)
		@position = args[:position]
		@person_queue = Array.new()
		@arrived = 0
	end

	############## Modify State #################
	def add_person(person)
		@person_queue.push(person)
	end

	def remove_person
		removed = @person_queue.pop
		return removed
	end

	def add_arrived
		@arrived = @arrived + 1
	end

	############## Get State #################
	def people_waiting
		return person_queue.length
	end

	def empty
		return person_queue.length == 0
	end

	def get_position
		return position
	end

	############## Printing #################
	def to_s
		print " " * 2
		print "A" * arrived
		print " " * (6 - arrived)
		print "|"
		print " " * 2
		print "P" * people_waiting
		print " " * (6 - people_waiting)
		print "|"
	end
end