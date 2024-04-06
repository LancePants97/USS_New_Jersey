class  Cell
    
    attr_reader :coordinate,
                :ship

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @empty = true
    end

    def empty?
        true
    end

    # def place_ship(ship)
        
    # end

end