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

    def render(visibility = false)
        if fired_upon? && !empty? && @ship.sunk?
            "X" # SUNK - cell containing a ship that has been sunk
        elsif fired_upon? && !empty? && !@ship.sunk?
            "H" # HIT - cell containing a ship that has been hit
        elsif fired_upon? && empty?
            "M" # MISS -cell containing no ship that has been hit
        elsif visibility == true && !fired_upon? && !empty?
            "S" # SHIP -cell containing a ship that hasn't been hit
        elsif !fired_upon?
            "." # default empty cell not fired upon
        end
    end
end