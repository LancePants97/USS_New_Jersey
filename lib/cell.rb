class  Cell
    
    attr_reader :coordinate
                

    attr_accessor :ship, :empty

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @empty = true      
    end

    def empty?
        @empty
    end

    def place_ship(ship)
        @empty = false
    end

end