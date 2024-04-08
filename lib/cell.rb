class  Cell
    
	attr_reader :coordinate, 
							:ship, 
							:empty, 
							:fired_upon	

	def initialize(coordinate)
		@coordinate = coordinate
		@ship = nil
		@empty = true     
		@fired_upon = false 
	end

	def empty?
		@empty
	end

	def place_ship(ship)
		@empty = false
		@ship = ship
	end

	def fired_upon?
		@fired_upon
	end

	def fire_upon
		@fired_upon = true
		if @empty == false
				register_hit
		end
	end

	def register_hit
		@ship.hit
	end

	def render
		if @fired_upon == false && @empty == true
				"." # default empty cell
		elsif @fired_upon == false && @empty == false
				"S" # SHIP -cell containing a ship that hasn't been hit
		elsif @fired_upon == true && @empty == true
				"M" # MISS -cell containing no ship that has been hit
		elsif @fired_upon == true && @empty == false && @ship.sunk? == false
				"H" # HIT - cell containing a ship that has been hit
		elsif @ship.sunk? == true
				"X" # SUNK - cell containing a ship that has been sunk
		end
	
	end
end