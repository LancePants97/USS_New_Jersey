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

end