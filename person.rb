class Person

	attr_reader :intended_floor

	def initialize(floor)
		@intended_floor = floor
	end

	def get_intended_floor
		return intended_floor
	end
end